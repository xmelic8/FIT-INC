-- fsm.vhd: Finite State Machine
-- Author(s): Michal Melichar (xmelic17@stud.fit.vutbr.cz) 
--
library ieee;
use ieee.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity fsm is
port(
   CLK         : in  std_logic;
   RESET       : in  std_logic;

   -- Input signals
   KEY         : in  std_logic_vector(15 downto 0);
   CNT_OF      : in  std_logic;

   -- Output signals
   FSM_CNT_CE  : out std_logic;
   FSM_MX_MEM  : out std_logic;
   FSM_MX_LCD  : out std_logic;
   FSM_LCD_WR  : out std_logic;
   FSM_LCD_CLR : out std_logic
);
end entity fsm;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of fsm is
   type t_state is (INPUT_1, INPUT_2, INPUT_3A, INPUT_4A, INPUT_5A, INPUT_6A, INPUT_7A, INPUT_8A, INPUT_9A, INPUT_10A,
												  INPUT_3B, INPUT_4B, INPUT_5B, INPUT_6B, INPUT_7B, INPUT_8B, INPUT_9B, INPUT_10B, INPUT_11B,
						  INPUT_ERR, PRINT_ERR, PRINT_OK, FINISH);
   signal present_state, next_state : t_state;

begin
-- -------------------------------------------------------
sync_logic : process(RESET, CLK)
begin
   if (RESET = '1') then
      present_state <= INPUT_1;
   elsif (CLK'event AND CLK = '1') then
      present_state <= next_state;
   end if;
end process sync_logic;

-- -------------------------------------------------------
next_state_logic : process(present_state, KEY, CNT_OF)
begin
   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_1 =>
      next_state <= INPUT_1;
		if (KEY(9) = '1') then
			next_state <= INPUT_2;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_2 =>
      next_state <= INPUT_2;
		if (KEY(2) = '1') then
			next_state <= INPUT_3A;
		elsif (KEY(6) = '1') then
			next_state <= INPUT_3B;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_3A =>
      next_state <= INPUT_3A;
		if (KEY(3) = '1') then
			next_state <= INPUT_4A;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_4A =>
      next_state <= INPUT_4A;
		if (KEY(3) = '1') then
			next_state <= INPUT_5A;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_5A =>
      next_state <= INPUT_5A;
		if (KEY(6) = '1') then
			next_state <= INPUT_6A;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_6A =>
      next_state <= INPUT_6A;
		if (KEY(4) = '1') then
			next_state <= INPUT_7A;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_7A =>
      next_state <= INPUT_7A;
		if (KEY(3) = '1') then
			next_state <= INPUT_8A;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_8A =>
      next_state <= INPUT_8A;
		if (KEY(4) = '1') then
			next_state <= INPUT_9A;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_9A =>
      next_state <= INPUT_9A;
		if (KEY(9) = '1') then
			next_state <= INPUT_10A;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_10A =>
      next_state <= INPUT_10A;
		if (KEY(15) = '1') then
			next_state <= PRINT_OK;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_3B =>
      next_state <= INPUT_3B;
		if (KEY(1) = '1') then
			next_state <= INPUT_4B;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_4B =>
      next_state <= INPUT_4B;
		if (KEY(6) = '1') then
			next_state <= INPUT_5B;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_5B =>
      next_state <= INPUT_5B;
		if (KEY(1) = '1') then
			next_state <= INPUT_6B;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_6B =>
      next_state <= INPUT_6B;
		if (KEY(9) = '1') then
			next_state <= INPUT_7B;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_7B =>
      next_state <= INPUT_7B;
		if (KEY(8) = '1') then
			next_state <= INPUT_8B;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_8B =>
      next_state <= INPUT_8B;
		if (KEY(9) = '1') then
			next_state <= INPUT_9B;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_9B =>
      next_state <= INPUT_9B;
		if (KEY(8) = '1') then
			next_state <= INPUT_10B;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_10B =>
      next_state <= INPUT_10B;
		if (KEY(9) = '1') then
			next_state <= INPUT_11B;
		elsif (KEY(15) = '1') then
         next_state <= PRINT_ERR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_11B =>
      next_state <= INPUT_11B;
		if (KEY(15) = '1') then
			next_state <= PRINT_OK;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= INPUT_ERR;
       end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when INPUT_ERR =>
		next_state <= INPUT_ERR;
		if (KEY(15) = '1') then
			next_state <= PRINT_ERR;
		end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_ERR =>
      next_state <= PRINT_ERR;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRINT_OK =>
      next_state <= PRINT_OK;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      next_state <= FINISH;
      if (KEY(15) = '1') then
         next_state <= INPUT_1; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   end case;
end process next_state_logic;

-- -------------------------------------------------------
output_logic : process(present_state, KEY)
begin
   FSM_CNT_CE     <= '0';
   FSM_MX_MEM     <= '0';
   FSM_MX_LCD     <= '0';
   FSM_LCD_WR     <= '0';
   FSM_LCD_CLR    <= '0';

   case (present_state) is
	-- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_ERR =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
   -- - - - - - - - - - - - - - - - - - - - - - -
	when PRINT_OK =>
      FSM_MX_MEM     <= '1';
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
	-- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
		if (KEY(14 downto 0) /= "000000000000000") then
         FSM_LCD_WR     <= '1';
      end if;
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   end case;
end process output_logic;

end architecture behavioral;

