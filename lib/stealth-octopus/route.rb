module StealthOctopus
  class Route
    RouteRule = Struct.new(
      :pattern,
      :flow,
      :state,
      :options
    )

    def self.match(pattern, flow:, state:, options: {})
      routes << RouteRule.new(pattern, flow, state, options)
    end

    def self.routes
      @@routes ||= []
    end

    def self.dispatch(bot, text_message)
      matcheds = routes.map do |rule|
        if matches_pattern?(rule.pattern, text_message)
          bot.step_to(flow: rule.flow, state: rule.state)
          true
        end
      end

      matcheds.any?
    end

    def self.matches_pattern?(pattern, text_message)
      pattern === text_message
    end

  end
end
