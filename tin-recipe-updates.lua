local util = require("data-util");


-- Main vanilla changes

local organotins_quant = mods.Krastorio2 and 10 or 5
util.replace_some_ingredient("plastic-bar", "petroleum-gas", organotins_quant, "organotins", organotins_quant)

util.replace_some_ingredient("pipe-to-ground", "lead-plate", 3, "solder", 3)
util.replace_some_ingredient("pipe-to-ground", "iron-plate", 3, "solder", 3)
util.multiply_recipe("electronic-circuit", 2)
util.replace_some_ingredient("electronic-circuit", "copper-cable", 1, "solder", 1)
util.replace_some_ingredient("advanced-circuit", "copper-cable", 1, "solder", 1)
util.add_ingredient("chemical-plant", "solder", 5)
util.add_ingredient("oil-refinery", "solder", 5)
util.add_ingredient("assembling-machine-2", "solder", 5)
util.add_ingredient("rocket-silo", "solder", 100)

-- glass
if mods.Krastorio2 then
  util.replace_some_ingredient("glass", "sand", 1, "tin-plate", 1)
  util.add_product("glass", {type="item", name="tin-plate", amount=1, probability=0.8})
  util.set_main_product("glass", "glass")
elseif mods["aai-industry"] then
  if mods.bzfoundry then
    if not mods.bzaluminum then
      util.multiply_recipe("glass-from-sand", 4)
    end
    util.replace_some_ingredient("glass-from-sand", "sand", 1, "tin-plate", 1)
    util.add_product("glass-from-sand", {type="item", name="tin-plate", amount=1, probability=0.8})
    util.set_main_product("glass-from-sand", "glass")
    util.set_to_founding("glass-from-sand")
  end
end
-- NOTE: K2 seems to reset this recipe, so moved to final fixes
-- util.replace_some_ingredient("se-glass-vulcanite", "sand", 1, "tin-plate", 1)
-- util.add_product("se-glass-vulcanite", {type="item", name="tin-plate", amount=1, probability=0.8})
-- util.set_main_product("se-glass-vulcanite", "glass")
-- end glass


util.add_product("se-scrap-recycling", {name="tin-ore", amount=1, probability=0.05})
util.add_ingredient("se-experimental-alloys-data", "tin-plate", 1)
util.add_to_product("se-experimental-alloys-data", "se-experimental-alloys-data", 1)
util.add_to_product("se-experimental-alloys-data", "se-scrap", 1)
util.add_to_ingredient("se-experimental-alloys-data", "se-empty-data", 1)

util.multiply_recipe("lithium-sulfur-battery", 2)
util.replace_some_ingredient("lithium-sulfur-battery", "copper-plate", 1, "tin-plate", 1)



if util.me.use_cable() then
  util.add_prerequisite("circuit-network", "tinned-cable")
  util.replace_ingredient("arithmetic-combinator", "copper-cable", "tinned-cable")
  util.replace_ingredient("decider-combinator", "copper-cable", "tinned-cable")
  util.replace_ingredient("constant-combinator", "copper-cable", "tinned-cable")
  util.replace_ingredient("power-switch", "copper-cable", "tinned-cable")
  util.replace_ingredient("programmable-speaker", "copper-cable", "tinned-cable")

  local modded_combinators = {"timer-combinator", "counting-combinator", "random-combinator",
    "power-combinator", "max-combinator", "min-combinator", "and-gate-combinator",
    "nand-gate-combinator", "nor-gate-combinator", "not-gate-combinator", "or-gate-combinator",
    "xnor-gate-combinator", "xor-gate-combinator", "converter-combinator", "detector-combinator",
    "sensor-combinator", "railway-combinator", "color-combinator", "daytime-combinator",
    "statistic-combinator", "pollution-combinator", "emitter-combinator", "receiver-combinator",
    "crafting_combinator:crafting-combinator",
    "crafting_combinator:recipe-combinator",
    "clock-combinator",
    "power-meter-combinator",
    "ghost-scanner",
    "item-sensor",
    "bi-pollution-sensor",
  }
  for i, v in pairs(modded_combinators) do
    util.replace_ingredient(v, "copper-cable", "tinned-cable")
  end
end