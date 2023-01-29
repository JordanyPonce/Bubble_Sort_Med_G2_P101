library ieee; 
use ieee.std_logic_1164.all;

entity MSS2 is
      port (clk, resetn, start,WriteData, Fin_j, AmenB, Fin_i, Mostrar,Activacion,Comp: in std_logic;
		      enj,ldj,WritingData,ModoRAM,eni,ldi,Reg_j,Sel_Add_j_i,Reg_i,SelWrite,Write_j_i,done,En_UD,Ld_UD,Sel_Add_Cont,SelMos: out std_logic;
																																								Estados: out std_logic_vector(7 downto 0)); 
end MSS2;

 architecture solucion of MSS2 is
 type estado is (A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R);
 signal y: estado; 
 begin
		 process(clk, resetn)
		 begin
		     
			  if resetn = '0' then y <= A; 
			  elsif (clk'event and clk = '1') then
			       case y is
					      
							when A => if start='1' then y<=B; else y<=A; end if;
							when B => if start='0' then y<=C; else y<=B; end if;
							when C => if WriteData='0' then y<=C; end if;
										 if WriteData='1' and Fin_j='0' then y<=D; end if;
										 if Fin_j='1' then y<=E; end if;
							when D => y<=C;
							when E => if Fin_j='1' then y<=J; else y<=F; end if;
							when F => y<=O;
							when O => y<=G;
							when G => y<=P;
							when P => if AmenB='1' then y<=N; else y<=I; end if;
							when N => y<=Q;
							when Q => y<=H;
							when H => y<=R; 
							when R => y<=I;
							when I => if Fin_i='1' then y<=E; else y<=G; end if;
							when J => if Mostrar='0' and start='0' then y<=J;
										 elsif Mostrar='0' and start='1' then y<=M; end if;
										 if Mostrar='1' then y<=K; end if;
							when K => y<=L;
							when L => if Comp='1' then y<=J;
										 elsif Comp='0' and start='0' then y<=K;
										 elsif Comp='0' and start='1' then y<=M; end if;
							when M => if start='1' then y<=M; else y<=A; end if;
							
					  end case;
			   end if; 
			end process; 	
			
process(y, start, WriteData, Fin_j, AmenB, Fin_i, Mostrar, Activacion, Comp)
begin 
   Estados<="00000000";
	enj<='0';ldj<='0';WritingData<='0';	ModoRAM<='0';eni<='0';ldi<='0';
	Reg_j<='0';Sel_Add_j_i<='0';Reg_i<='0';	SelWrite<='0';Write_j_i<='0';
	En_UD<='0';Ld_UD<='0';Sel_Add_Cont<='0';	SelMos<='0';done<='0';
	  case y is
		    when A => enj<='1';ldj<='1'; Estados<="01000001";
			 
			 when B => Estados<="01000010";
			 
			 when C => WritingData<='1'; Estados<="01000011";
						  if WriteData='1' then ModoRAM<='1'; end if;
						  if Fin_j='1' then enj<='1';ldj<='1'; end if;
			
			 when D => enj<='1'; Estados<="01000100";
			 
			 when E => Estados<="01000101";
			 			 
			 when F => eni<='1'; ldi<='1'; Reg_j<='1'; Estados<="01000110";
			 when O => eni<='1'; ldi<='1'; Reg_j<='1'; Estados<="01000110";
			 when G => Sel_Add_j_i<='1'; Reg_i<='1'; SelWrite<='1'; Estados<="01000111";
			 when P => Sel_Add_j_i<='1'; Reg_i<='1'; SelWrite<='1'; Estados<="01000111";
			 
			 when H => ModoRAM<='1'; SelWrite<='1'; Write_j_i<='1'; Estados<="01001000";
			 when R => ModoRAM<='1'; SelWrite<='1'; Write_j_i<='1'; Estados<="01001000";

			 when I => if Fin_i='1' then enj<='1'; else eni<='1'; end if;  Estados<="01001001";
			 
			 when J => done<='1'; En_UD<='1'; Ld_UD<='1'; Estados<="01001010";
			 
			 when K => Sel_Add_Cont<='1';	SelMos<='1'; Estados<="01001011";
			 
			 when L => Sel_Add_Cont<='1'; SelMos<='1'; En_UD<='1'; Estados<="01001100"; 
			 
			 when M => Estados<="01001101";
			 
			 when N => Sel_Add_j_i<='1'; ModoRAM<='1'; SelWrite<='1';Estados<="01001110";
			 when Q => Sel_Add_j_i<='1'; ModoRAM<='1'; SelWrite<='1';Estados<="01001110";
	   end case; 
end process; 
end solucion;