# Phoenix Live Favicon

  Provides commands for manipulating the Favicon of Phoenix Live View applications
  while minimizing data over the wire.

  The available command actions support a variety of utility operations useful for
  Favicon manipulation. Such as setting or removing tag attributes and
  adding or removing CSS classes for vector (SVG) favicons.

  A special feature is the use of the `{dynamic}` tag in values. This saves 
  data over the wire by only sending a part of the value.

## Installation

Te package can be installed by adding `phoenix_live_favicon` to your list of dependencies in `mix.exs`:

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

## Usage
Add one or multiple sizes of your favicon to your applications main template. It's
attributes can be manipulated using the convenience functions from the [Phx.Live.Favicon module](Phx.Live.Favicon.html)


### Example
```heex
<!-- in /templates/layout/root.html.heex -->
<!-- some attributes have been omitted to fit box width -->
<link [...] data-dynamic-href="images/{dynamic}/favicon-32x32.png" href={"images/favicon-32x32.png"}>
<link [...] data-dynamic-href="images/{dynamic}/favicon-16x16.png" href={"images/favicon-16x16.png"}>
```

In this example the page shows `images/favicon-32x32.png` by default.

**When the user opens a chat, we want to show an favicon with an envelope.**  
Action: `Favicon.set_dynamic(socket, 'href', 'no_messages_unread')`  
Result: The href will become `images/no_messages_unread/favicon-32x32.png`.  

**When we send the user a message, the favicon should indicate a message is received.**
Action: `Favicon.set_dynamic(socket, 'href', 'messages_unread')`  
Result: The href becomes `images/messages_unread/favicon-32x32.png`.  

To return the favicon to it's default after the chat is closed simply call `Favicon.reset(socket)`.

For all functions have a look at the documentation at [HexDocs](Phx.Live.Favicon.html)
