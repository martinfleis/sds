-- environment.lua

local function button_clear(div, defaultTitle, defaultClass, borderColor)
  local beginDiv = ""
  local buttonClass = div.attr.attributes['button-class']

  -- quarto.log.output("=== button-clear ===")
  -- quarto.log.output(div)

  beginDiv = beginDiv .. "<button x-on:click='clear()'"
  if buttonClass then
    beginDiv = beginDiv .. 'class=' .. "'" .. buttonClass .. "'" .. '>'
  else
    beginDiv = beginDiv .. 'class=' .. "'" .. defaultClass .. "'" .. '>'
  end

  local title = div.attr.attributes['title']
  if title then
    beginDiv = beginDiv .. title
  else
    beginDiv = beginDiv .. defaultTitle
  end
  beginDiv = beginDiv .. "</button>\n"

  if borderColor == nil then
    borderColor = "card card-body"
  else
    borderColor = "card card-body " .. borderColor
  end

  local endDiv = "\n"

  table.insert(div.content, pandoc.RawBlock('html', beginDiv))
  table.insert(div.content, pandoc.RawBlock('html', endDiv))

  -- quarto.log.output("=== \n\n\n\n")
  -- quarto.log.output(div)

  return div
end


local function button(div, defaultTitle, defaultClass, borderColor)
  local beginDiv = "<div x-data='{ open: false }'>\n"
  local buttonClass = div.attr.attributes['button-class']
  beginDiv = beginDiv .. "<button x-on:click='open = ! open'"
  if buttonClass then
    beginDiv = beginDiv .. 'class=' .. "'" .. buttonClass .. "'" .. '>'
  else
    beginDiv = beginDiv .. 'class=' .. "'" .. defaultClass .. "'" .. '>'
  end

  local title = div.attr.attributes['title']
  if title then
    beginDiv = beginDiv .. title
  else
    beginDiv = beginDiv .. defaultTitle
  end
  beginDiv = beginDiv .. "</button>\n"

  if borderColor == nil then
    borderColor = "card card-body"
  else
    borderColor = "card card-body " .. borderColor
  end

  beginDiv = beginDiv ..
      "<div x-show='open' x-transition.duration.200ms x-on:click.outside='open = false' class='" ..
      borderColor .. "'" .. ">"
  local endDiv = "</div>\n</div>\n"

  table.insert(div.content, 1, pandoc.RawBlock('html', beginDiv))
  table.insert(div.content, pandoc.RawBlock('html', endDiv))
  -- quarto.log.output(div)
  return div
end


local function choice(blocks, correct, idx)
  local htmlStart = ''

  if correct == true then
    htmlStart = htmlStart ..
    '<p><input class="form-check-input" type="radio" x-model="answer" value="correct"> <span id="correct" x-show="answer == $el.id" class="badge">&#10003;</span>'
  else
    htmlStart = htmlStart ..
        '<p><input class="form-check-input" type="radio" x-model="answer" value="no' ..
        idx .. '"> <span id="no' .. idx .. '" x-show="answer == $el.id" class="badge">&#10007;</span>'
  end
  table.insert(blocks[1].content, 1, pandoc.RawInline('html', htmlStart))
  table.insert(blocks[1].content, pandoc.RawInline('html', '</p>'))

  return blocks
end


local function choices(div)
  local correct = false
  if div.tag == "Div" then
    if div.attr.classes:includes("choices") then
      for idx, subDiv in ipairs(div.content) do
        if subDiv.attr.classes:includes("choice") then
          if subDiv.attr.classes:includes("correct-choice") then
            correct = true
          else
            correct = false
          end
          choice(subDiv.content, correct, idx)
        end
        if subDiv.attr.classes:includes("button-clear") then
          -- quarto.log.output("=== button-clear ===")
          -- quarto.log.output(subDiv)
          button_clear(subDiv, "Clear answer", "btn btn-light")
        end
      end
      table.insert(div.content, 1,
        pandoc.RawBlock('html',
          '<div x-data="{ answer: \'\' , clear() { this.answer = \'\' }}">\n'))
      table.insert(div.content, pandoc.RawBlock('html', '</div>\n'))
    end
  end
  return div
end


local function question(div)
  for idx, blocks in ipairs(div) do
    if blocks.tag == "Div" then
      choices(blocks)
    end
  end

  return div
end



local function writeEnvironments(div)
  if quarto.doc.is_format("html") then
    quarto.doc.add_html_dependency({
      name = "alpine",
      version = "3.12",
      scripts = {
        { path = "js/alpine@3.12.min.js", afterBody = "true" } },
      stylesheets = { "css/buttons.css" }
    })
    if div.attr.classes:includes("question") then
      -- quarto.log.output("=== question ===")
      -- quarto.log.output(div)
      div.content = question(div.content)
    end
    if div.attr.classes:includes("button-hint") then
      div = button(div, "Hint", "btn btn-warning", "border-warning")
      -- quarto.log.output("=== button-hint ===")
    end
    if div.attr.classes:includes("button-answer") then
      div = button(div, "Answer", "btn btn-info", "border-info")
      -- quarto.log.output("=== button-answer ===")
    end
    return (div)
  end
end

-- Run in two passes so we process metadata
-- and then process the divs
return {
  { Div = writeEnvironments }
}
