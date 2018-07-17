Stealth Octoputs give to [Stealth](https://hellostealth.com) more friendly route handle to process payloads.
PS: This only a simple test of concept.

## Getting Started

Getting started with Stealth Octopus is simple:


Add to Gemfile

```
gem 'stealth-octopus'
```


Create `config/routes.rb` with this content

```
require 'stealth-octopus'

class Routes < StealthOctopus::Route
  match(/HELLO/, flow: 'hello', state: 'say_hello')
  match(/GOODBYE/, flow: 'goodbye', state: 'say_goodbye')
end
```

in `bot_controller.rb` add to route method:

```
  def route
    if current_message.payload.present?
      Routes.dispatch(self, current_message.payload)
      current_message.payload = nil
      return
    end

    if current_session.present?
      step_to session: current_session
    else
      step_to flow: 'hello', state: 'say_hello'
    end
  end
```


## Thanks

Stealth wouldn't exist without the great work of many other open source projects and people including:

* [Stealth](https://hellostealth.com) for creating this awesome bot framework to Ruby.
* [Defensoria Pública do Estado do Tocantins](http://www.defensoria.to.def.br) for belive in this project.

## License

Stealth Octopus source code is released under the MIT License.
