function event_say(e)
  if(e.message:findi("bloodsaber")) then
    e.self:Say("A Bloodsaber? Of course I'm not, don't be ridiculous!");
  end
end

function event_trade(e)
  local item_lib = require("item_turnin");
  if(item_lib.check_turn_in(e.trade, {item1 = 2344})) then
    e.other:SummonItem(2394);
	eq.set_timer("depop",60000);
  end
  if(item_lib.return_items(e.self, e.other, e.trade)) then
   	e.self:Say(string.format("I have no need for this %s, you can have it back.",e.other:GetName()));
  end
end

function event_timer(e)
  if(e.timer == "depop") then
    eq.stop_timer("depop");
    eq.depop();
  end
end
