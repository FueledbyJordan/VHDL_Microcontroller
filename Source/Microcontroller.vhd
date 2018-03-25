library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Microcontroller is
    Port(
        instruction : in std_logic_vector(7 downto 0);
        clk : in std_logic;
        sbus : out std_logic_vector(7 downto 0);
        dbus : out std_logic_vector(7 downto 0);
        aluout : out std_logic_vector(7 downto 0);
        immed : out std_logic_vector(7 downto 0);
        aluop : out std_logic_vector(1 downto 0); 
        negative : out std_logic;
        zero : out std_logic;
        pcsel : out std_logic;
        pcload : out std_logic;
        r0 : out std_logic_vector(7 downto 0);
        r1 : out std_logic_vector(7 downto 0);
        r2 : out std_logic_vector(7 downto 0);
        r3 : out std_logic_vector(7 downto 0)
    );
end entity;

architecture Behavioral of Microcontroller is

component Register_File is
    Port ( dwrite : in STD_LOGIC;
           dval : in STD_LOGIC_VECTOR (7 downto 0);
           sregsel : in STD_LOGIC_vector (1 downto 0);
           dregsel : in STD_LOGIC_vector (1 downto 0);
           sbus : out STD_LOGIC_VECTOR (7 downto 0);
           dbus : out STD_LOGIC_VECTOR (7 downto 0);
           Zero : out STD_LOGIC;
           Negative : out STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end component;

component Decode_Logic is
    port(
        instruction : in std_logic_vector(7 downto 0); --instruction input from IR
        zero : in std_logic; --zero line from Register File; pass to pcload
        negative : in std_logic; --negative from Register File; pass to pcload
        stage : in std_logic_vector(1 downto 0); --input from the stage counter
        addrsel : out std_logic_vector(1 downto 0);
        irload : out std_logic;
        imload : out std_logic;
        regsel: out std_logic_vector(1 downto 0);
        dwrite: out std_logic;
        aluop: out std_logic_vector(1 downto 0);
        readwrite: out std_logic;
        pcsel: out std_logic;
        pcload: out std_logic;
        sregsel: out std_logic_vector(1 downto 0);
        dregsel: out std_logic_vector(1 downto 0)
);
end component;

component PC is
    Port ( Immed_in : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in std_logic;
           pcsel : in std_logic;
           pcload : in std_logic;
           sbus : in std_logic_vector (7 downto 0 );
           dbus : in std_logic_vector (7 downto 0 );
           addrsel  : in std_logic_vector (1 downto 0);
           address : out STD_LOGIC_VECTOR (7 downto 0):="00000000");
end component;

component ALU is
    Port (
        A : in STD_LOGIC_VECTOR(7 downto 0);
        B : in STD_LOGIC_VECTOR(7 downto 0);
        aluop : in STD_LOGIC_VECTOR(3 downto 0);
        result : out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

component IR_reg is
    Port ( IR_in : in STD_LOGIC_VECTOR (7 downto 0);
           IR_out : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           enable : in STD_LOGIC);
end component;

component Immed_reg is
    Port ( Immed_in : in STD_LOGIC_VECTOR (7 downto 0);
           Immed_out : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           enable : in STD_LOGIC);
end component;

COMPONENT MEMORY IS
    PORT(
        address : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
        dataout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
        datain : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        readwrite : IN STD_LOGIC;-- := '0';   --read is 1, write is 0
        clk : in STD_LOGIC := '0';
        rst : in STD_LOGIC := '0'
    );
END COMPONENT;

component Stage_Count is
  Port ( 
  clk, rst: in std_logic;
  stage:    out std_logic_vector(1 downto 0):= "00"
  );
end component;

--Register bus
signal r0bus : std_logic_vector(7 downto 0);
signal r1bus : std_logic_vector(7 downto 0);
signal r2bus : std_logic_vector(7 downto 0);
signal r3bus : std_logic_vector(7 downto 0); 
--ALU bus
signal aluoutbus : std_logic_vector(7 downto 0);
--Register Data bus
signal sbusline : std_logic_vector(7 downto 0);
signal dbusline : std_logic_vector(7 downto 0);
signal addressbus : std_logic_vector(7 downto 0);
signal datainbus : std_logic_vector(7 downto 0);
signal pcoutbus : std_logic_vector(7 downto 0);
signal middlemux : std_logic_vector(7 downto 0);
signal zline : std_logic;
signal nline : std_logic;
signal reset : std_logic;
signal irline : std_logic_vector(7 downto 0);
--Control Lines
signal addrselline : std_logic_vector(1 downto 0);
signal irloadline : std_logic;
signal imloadline : std_logic;
signal regselline : std_logic_vector(1 downto 0);
signal dwriteline : std_logic;
signal aluopline : std_logic_vector(1 downto 0);
signal readwriteline : std_logic;
signal pcselline : std_logic;
signal pcloadline : std_logic;
signal sregselline : std_logic_vector(1 downto 0);
signal dregselline : std_logic_vector(1 downto 0);
signal stageline : std_logic_vector(1 downto 0);

begin

Regs: Register_File port map(dwrite=>dwriteline,dval=>middlemux,sregsel=>sregselline,dregsel=>dregselline,sbus=>sbusline,dbus=>dbusline,Zero=>zline,Negative=>nline,clk=>clk,reset=>reset);
Decode: Decode_Logic port map(instruction=>irline,zero=>zline,negative=>nline,stage=>stageline,addrsel=>addrselline,irload=>irloadline,imload=>imloadline,regsel=>regselline,dwrite=>dwriteline,aluop=>aluopline,readwrite=>readwriteline,pcsel=>pcselline,pcload=>pcloadline,sregsel=>sregselline,dregsel=>dregselline);


end Behavioral;