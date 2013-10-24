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
use work.CommonPckg.all;
use work.HostIoPckg.all;

entity test1 is
  port (
    chan_clk : out std_logic;
    a        : out std_logic_vector (15 downto 0);
    b        : in  std_logic_vector (15 downto 0)
    );
end entity;

architecture arch of test1 is
begin

  chan_clk <= LO;

  u0 : HostIoToDut
    generic map (
      SIMPLE_G => true
      )
    port map (
      vectorFromDut_i => b,
      vectorToDut_o   => a
      );

end architecture;

