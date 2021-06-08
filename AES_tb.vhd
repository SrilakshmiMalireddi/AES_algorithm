--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:41:19 07/10/2015
-- Design Name:   
-- Module Name:   C:/Users/Shourya/Desktop/New folder/AES_VHDL/AES_tb.vhd
-- Project Name:  AES_VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: AES
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY AES_tb IS
END AES_tb;
 
ARCHITECTURE behavior OF AES_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AES
    PORT(
         clk : IN  std_logic;
         input : IN  std_logic_vector(127 downto 0);
         enckey : IN  std_logic_vector(127 downto 0);
         output : OUT  std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal input : std_logic_vector(127 downto 0) := (others => '0');
   signal enckey : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(127 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AES PORT MAP (
          clk => clk,
          input => input,
          enckey => enckey,
          output => output
        );
process
begin
wait for 100 ns; 
clk <= '0';
input <= x"3243f6a8885a308d313198a2e0370734";
enckey <=    x"2b7e151628aed2a6abf7158809cf4f3c";
   end process;

END;