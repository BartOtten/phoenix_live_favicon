# Phoenix Live Favicon

  Provides commands for manipulating the Favicon of Phoenix Live View applications
  while minimizing data over the wire.

  The available command actions support a variety of utility operations useful for
  Favicon manipulation. Such as setting or removing tag attributes and
  adding or removing CSS classes for vector (SVG) favicons.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `phoenix_live_head` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:phoenix_live_favicon, "~> 0.1.0"}
  ]
end
```

To include the necessary client side Javascript, import the Javascript module 
from dependency [Phoenix Live Head](https://github.com/BartOtten/phoenix_live_head) in `assets/js/app.js`

```javascript
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import { Socket } from "phoenix"
import { LiveSocket } from "../vendor/phoenix_live_view/"
import topbar from "../vendor/topbar"
import "phoenix_live_head" // <-- ADD HERE.
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/phoenix_live_favicon>.

