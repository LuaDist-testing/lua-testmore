#! /usr/bin/lua
--
-- lua-TestMore : <http://testmore.luaforge.net/>
--
-- Copyright (C) 2009, Perrad Francois
--
-- This code is licensed under the terms of the MIT/X11 license,
-- like Lua itself.
--

--[[

=head1 Lua for statement

=head2 Synopsis

    % prove 015-forlist.t

=head2 Description

See "Lua 5.1 Reference Manual", section 2.4.5 "For Statement",
L<http://www.lua.org/manual/5.1/manual.html#2.4.5>.

See "Programming in Lua", section 4.3 "Control Structures".

=cut

--]]

print("1..18")

a = {"ok 1 - for ipairs", "ok 2 - for ipairs", "ok 3 - for ipairs"}
for _, v in ipairs(a) do
    print(v)
end
for i, v in ipairs(a) do
    print("ok " .. 3+i .. " - for ipairs")
end

r = false
t = {a=10, b=100}
for i, v in ipairs(t) do
    print(i, v)
    r = true
end
if r then
    print("not ok 7 - for ipairs (hash)")
else
    print("ok 7 - for ipairs (hash)")
end

for k in pairs(a) do
    print("ok " .. 7+k .. " - for pairs")
end

local i = 1
for k in pairs(t) do
    if k == 'a' or k == 'b' then
        print("ok " .. 10+i .. " - for pairs (hash)")
    else
        print("not ok " .. 10+i .. " - " .. k)
    end
    i = i + 1
end

a = {"ok 13 - for break", "ok 14 - for break", "stop", "more"}
local i
for _, v in ipairs(a) do
    if v == "stop" then break end
    print(v)
    i = _
end
if i == 2 then
    print("ok 15 - break")
else
    print("not ok 15 - " .. i)
end

local a = {[1]="ok 16 - for & upval", [2]="ok 17 - for & upval", [3]="ok 18 - for & upval"}
local b = {}
for i, v in pairs(a) do
    b[i] = function () return v end
end
print(b[1]())
print(b[2]())
print(b[3]())

-- Local Variables:
--   mode: lua
--   lua-indent-level: 4
--   fill-column: 100
-- End:
-- vim: ft=lua expandtab shiftwidth=4: