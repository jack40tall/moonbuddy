'use strict'

const botSchema = {
  type: 'object',
  required: ['bot_id', 'bot_name', 'bot_description', 'bot_filepath'],
  properties: {
    bot_id: { type: 'number', minimum: 0 },
    bot_name: { type: 'string' },
    bot_description: { type: 'string' },
    bot_filepath: { type: 'string' },
  },
}

const botsSchema = {
  type: 'object',
  required: ['bots'],
  properties: {
    strategies: {
      type: 'array',
      items: botSchema,
    },
  },
}

module.exports = async function (fastify, opts) {
  fastify.route({
    method: 'GET',
    url: '/bots',
    schema: {
      summary: 'Get bots',
      tags: ['bots'],
      response: {
        200: botsSchema,
      },
    },
    handler: async (request, reply) => {
      const { rows: bots } = await fastify.pg.query(
        'select bot_id, bot_name, bot_description, bot_filepath from bots'
      )
      return { bots }
    },
  })

  fastify.route({
    method: 'GET',
    url: '/bots/:bot_id',
    schema: {
      summary: 'Get bot',
      tags: ['Bot'],
      params: {
        type: 'object',
        required: ['bot_id'],
        properties: {
          bot_id: { type: 'integer', minimum: 0 },
        },
      },
      response: {
        200: botSchema,
      },
    },
    handler: async (request, reply) => {
      const {
        rows: [bot],
      } = await fastify.pg.query(
        'select bot_id, bot_name, bot_description, bot_filepath from bots where bot_id = $1',
        [request.params.bot_id]
      )
      if (!bot) reply.callNotFound()
      return bot
    },
  })
}
