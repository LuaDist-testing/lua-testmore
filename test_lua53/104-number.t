#! /usr/bin/lua
--
-- lua-TestMore : <http://fperrad.github.com/lua-TestMore/>
--
-- Copyright (C) 2009-2015, Perrad Francois
--
-- This code is licensed under the terms of the MIT/X11 license,
-- like Lua itself.
--

--[[

=head1 Lua number & coercion

=head2 Synopsis

    % prove 104-number.t

=head2 Description

=cut

--]]

require 'Test.More'

plan(92)

is(-1, -(1), "-1")

is(~4, -5, "~4")

error_like(function () return ~3.14 end,
           "^[^:]+:%d+: number has no integer representation",
           "~3.14")

is(not 1, false, "not 1")

is(10 + 2, 12, "10 + 2")

is(2 - 10, -8, "2 - 10")

is(3.14 * 1, 3.14, "3.14 * 1")

is(-7 / 0.5, -14, "-7 / 0.5")

type_ok(1.0 / 0.0, 'number', "1.0 / 0.0")

is(-25 % 3, 2, "-25 % 3")

error_like(function () return 1 % 0 end,
           "^[^:]+:%d+: attempt to perform 'n%%0'",
           "1 // 0")

is(25.5 // 3.5, 7.0, "25.5 // 3.5")

is(25 // 3, 8, "25 // 3")

is(25 // -3, -9, "25 // -3")

is(1 // -1, -1, "1 // -1")

type_ok(1.0 // 0, 'number', "1.0 // 0")

error_like(function () return 1 // 0 end,
           "^[^:]+:%d+: attempt to divide by zero",
           "1 // 0")

is(3 & 7, 3, "3 & 7")

is(4 | 1, 5, "4 | 1")

is(7 ~ 1, 6, "7 ~ 1")

is(100 >> 5, 3, "100 >> 5")

is(3 << 2, 12, "3 << 2")

error_like(function () return 10 + true end,
           "^[^:]+:%d+: attempt to perform arithmetic on a boolean value",
           "10 + true")

error_like(function () return 2 - nil end,
           "^[^:]+:%d+: attempt to perform arithmetic on a nil value",
           "2 - nil")

error_like(function () return 3.14 * false end,
           "^[^:]+:%d+: attempt to perform arithmetic on a boolean value",
           "3.14 * false")

error_like(function () return -7 / {} end,
           "^[^:]+:%d+: attempt to perform arithmetic on a table value",
           "-7 / {}")

error_like(function () return 3 ^ true end,
           "^[^:]+:%d+: attempt to perform arithmetic on a boolean value",
           "3 ^ true")

error_like(function () return -25 % false end,
           "^[^:]+:%d+: attempt to perform arithmetic on a boolean value",
           "-25 % false")

error_like(function () return 25 // {} end,
           "^[^:]+:%d+: attempt to perform arithmetic on a table value",
           "25 // {}")

error_like(function () return 3 & true end,
           "^[^:]+:%d+: attempt to perform bitwise operation on a boolean value",
           "3 & true")

error_like(function () return 4 | true end,
           "^[^:]+:%d+: attempt to perform bitwise operation on a boolean value",
           "4 | true")

error_like(function () return 7 ~ true end,
           "^[^:]+:%d+: attempt to perform bitwise operation on a boolean value",
           "7 ~ true")

error_like(function () return 100 >> true end,
           "^[^:]+:%d+: attempt to perform bitwise operation on a boolean value",
           "100 >> true")

error_like(function () return 3 << true end,
           "^[^:]+:%d+: attempt to perform bitwise operation on a boolean value",
           "3 << true")

error_like(function () return 10 + 'text' end,
           "^[^:]+:%d+: attempt to perform arithmetic on a string value",
           "10 + 'text'")

error_like(function () return 2 - 'text' end,
           "^[^:]+:%d+: attempt to perform arithmetic on a string value",
           "2 - 'text'")

error_like(function () return 3.14 * 'text' end,
           "^[^:]+:%d+: attempt to perform arithmetic on a string value",
           "3.14 * 'text'")

error_like(function () return -7 / 'text' end,
           "^[^:]+:%d+: attempt to perform arithmetic on a string value",
           "-7 / 'text'")

error_like(function () return 25 % 'text' end,
           "^[^:]+:%d+: attempt to perform arithmetic on a string value",
           "25 % 'text'")

error_like(function () return 3 ^ 'text' end,
           "^[^:]+:%d+: attempt to perform arithmetic on a string value",
           "3 ^ 'text'")

error_like(function () return 25 // 'text' end,
           "^[^:]+:%d+: attempt to perform arithmetic on a string value",
           "25 // 'text'")

error_like(function () return 3 & 'text' end,
           "^[^:]+:%d+: attempt to perform bitwise operation on a string value",
           "3 & 'text'")

error_like(function () return 4 | 'text' end,
           "^[^:]+:%d+: attempt to perform bitwise operation on a string value",
           "4 | 'text'")

error_like(function () return 7 ~ 'text' end,
           "^[^:]+:%d+: attempt to perform bitwise operation on a string value",
           "7 ~ 'text'")

error_like(function () return 100 >> 'text' end,
           "^[^:]+:%d+: attempt to perform bitwise operation on a string value",
           "100 >> 'text'")

error_like(function () return 3 << 'text' end,
           "^[^:]+:%d+: attempt to perform bitwise operation on a string value",
           "3 << 'text'")

is(10 + '2', 12, "10 + '2'")

is(2 - '10', -8, "2 - '10'")

is(3.14 * '1', 3.14, "3.14 * '1'")

is(-7 / '0.5', -14, "-7 / '0.5'")

is(-25 % '3', 2, "-25 % '3'")

is(3 ^ '3', 27, "3 ^ '3'")

is(25.5 // '3.5', 7.0, "25.5 // '3.5'")

is(25 // '3', 8, "25 // '3'")

is(3 & '7', 3, "3 & '7'")

is(4 | '1', 5, "4 | '1'")

is(7 ~ '1', 6, "7 ~ '1'")

is(100 >> '5', 3, "100 >> '5'")

is(3 << '2', 12, "3 << '2'")

error_like(function () return 3.5 & 7 end,
           "^[^:]+:%d+: number has no integer representation",
           "3.5 & 7")

error_like(function () return 3 & 7.5 end,
           "^[^:]+:%d+: number has no integer representation",
           "3 & 7.5")

error_like(function () return 4.5 | 1 end,
           "^[^:]+:%d+: number has no integer representation",
           "4.5 | 1")

error_like(function () return 4 | 1.5 end,
           "^[^:]+:%d+: number has no integer representation",
           "4 | 1.5")

error_like(function () return 7.5 ~ 1 end,
           "^[^:]+:%d+: number has no integer representation",
           "7.5 ~ 1")

error_like(function () return 7 ~ 1.5 end,
           "^[^:]+:%d+: number has no integer representation",
           "7 ~ 1.5")

error_like(function () return 100.5 >> 5 end,
           "^[^:]+:%d+: number has no integer representation",
           "100.5 >> 5")

error_like(function () return 100 >> 5.5 end,
           "^[^:]+:%d+: number has no integer representation",
           "100 >> 5.5")

error_like(function () return 3.5 << 2 end,
           "^[^:]+:%d+: number has no integer representation",
           "3.5 << 2")

error_like(function () return 3 << 2.5 end,
           "^[^:]+:%d+: number has no integer representation",
           "3 << 2.5")

is(1 .. 'end', '1end', "1 .. 'end'")

is(1 .. 2, '12', "1 .. 2")

error_like(function () return 1 .. true end,
           "^[^:]+:%d+: attempt to concatenate a %w+ value",
           "1 .. true")

is(1.0 == 1, true, "1.0 == 1")

is(1 ~= 2, true, "1 ~= 2")

is(1 == true, false, "1 == true")

is(1 ~= nil, true, "1 ~= nil")

is(1 == '1', false, "1 == '1'")

is(1 ~= '1', true, "1 ~= '1'")

is(1 < 0, false, "1 < 0")

is(1 <= 0, false, "1 <= 0")

is(1 > 0, true, "1 > 0")

is(1 >= 0, true, "1 >= 0")

error_like(function () return 1 < false end,
           "^[^:]+:%d+: attempt to compare %w+ with %w+",
           "1 < false")

error_like(function () return 1 <= nil end,
           "^[^:]+:%d+: attempt to compare %w+ with %w+",
           "1 <= nil")

error_like(function () return 1 > true end,
           "^[^:]+:%d+: attempt to compare %w+ with %w+",
           "1 > true")

error_like(function () return 1 >= {} end,
           "^[^:]+:%d+: attempt to compare %w+ with %w+",
           "1 >= {}")

error_like(function () return 1 < '0' end,
           "^[^:]+:%d+: attempt to compare %w+ with %w+",
           "1 < '0'")

error_like(function () return 1 <= '0' end,
           "^[^:]+:%d+: attempt to compare %w+ with %w+",
           "1 <= '0'")

error_like(function () return 1 > '0' end,
           "^[^:]+:%d+: attempt to compare %w+ with %w+",
           "1 > '0'")

error_like(function () return 1 >= '0' end,
           "^[^:]+:%d+: attempt to compare %w+ with %w+",
           "1 >= '0'")

error_like(function () local a= 3.14; local b = a[1]; end,
           "^[^:]+:%d+: attempt to index",
           "index")

error_like(function () local a = 3.14; a[1] = 1; end,
           "^[^:]+:%d+: attempt to index",
           "index")

-- Local Variables:
--   mode: lua
--   lua-indent-level: 4
--   fill-column: 100
-- End:
-- vim: ft=lua expandtab shiftwidth=4:
