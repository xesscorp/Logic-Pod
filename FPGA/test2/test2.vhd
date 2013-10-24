--**********************************************************************
-- Copyright 2013 by XESS Corp <http://www.xess.com>.
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--**********************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;
use work.CommonPckg.all;
use work.ClkGenPckg.all;

entity test2 is
  port (
    clk_i    : in  std_logic;
    chan_clk : out std_logic;
    a        : out std_logic_vector (15 downto 0);
    b        : in  std_logic_vector (15 downto 0)
    );
end entity;

architecture arch of test2 is
signal clk_s : std_logic;
begin

  u0 : ClkGen
    generic map (CLK_MUL_G => 25, CLK_DIV_G => 3)
    port map (i => clk_i, o => clk_s);
  
  chan_clk <= clk_i;

  u1 : process (clk_s)
    variable cnt_v : integer := 0;
  begin
    if rising_edge(clk_s) then
      cnt_v := cnt_v + 1;
    end if;
    a <= CONV_STD_LOGIC_VECTOR(cnt_v, a'length);
  end process;

end architecture;

