local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local capitalise = function(str)
  return (str:gsub("^%l", string.upper))
end

local capitalise_node = function(index)
  return f(function(arg)
    return capitalise(arg[1][1])
  end, { index })
end

return {
  -- Basic import
  s("im", fmt([[
    import {} from {};
  ]], { i(1), i(2) })),
  -- useState hook
  s("us", fmt([[
    const [{}, set{}] = useState{}({});
  ]], { i(1, "value"), capitalise_node(1), i(2), i(3) })),
  -- useEffect hook
  s("ue", fmt([[
    useEffect(() => {
      %$
    }, [%$]);
  ]], { i(1), i(0) }, { delimiters = "%$" })),
  -- ts functional component
  s("rfc", fmt([[
    import React, {FC} from "react";

    type %$Props = {
      %$
    };

    const %$: FC<%$Props> = (%$) => {
      %$
      return (
        <div>
          <p>%$</p>
        </div>
      );
    };

    export default %$;
  ]], { rep(1), i(2), i(1), rep(1), i(3), i(0), rep(1), rep(1) }, { delimiters = "%$" })),
  s("clg", fmt("console.log({})", i(0)))
}
