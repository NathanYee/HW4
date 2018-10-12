`include "muxes.v"
`include "decoders.v"
`include "register.v" 

//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);
  // select which register we are going to write to
  wire[31:0] registerSelect;
  decoder1to32 selectedRegister(.out(registerSelect),.enable(RegWrite),.address(WriteRegister));

  wire[31:0] registers[31:0]; // I regret making the mux32to1by32 mux out of so many inputs.
  // register0 always outputs zero
  register32zero register0(.q(registers[0]),.d(WriteData),.wrenable(registerSelect[0]),.clk(Clk));

  // write data to the specified register.
  register32 register1(.q(registers[1]),.d(WriteData),.wrenable(registerSelect[1]),.clk(Clk));
  register32 register2(.q(registers[2]),.d(WriteData),.wrenable(registerSelect[2]),.clk(Clk));
  register32 register3(.q(registers[3]),.d(WriteData),.wrenable(registerSelect[3]),.clk(Clk));
  register32 register4(.q(registers[4]),.d(WriteData),.wrenable(registerSelect[4]),.clk(Clk));
  register32 register5(.q(registers[5]),.d(WriteData),.wrenable(registerSelect[5]),.clk(Clk));
  register32 register6(.q(registers[6]),.d(WriteData),.wrenable(registerSelect[6]),.clk(Clk));
  register32 register7(.q(registers[7]),.d(WriteData),.wrenable(registerSelect[7]),.clk(Clk));
  register32 register8(.q(registers[8]),.d(WriteData),.wrenable(registerSelect[8]),.clk(Clk));
  register32 register9(.q(registers[9]),.d(WriteData),.wrenable(registerSelect[9]),.clk(Clk));
  register32 register10(.q(registers[10]),.d(WriteData),.wrenable(registerSelect[10]),.clk(Clk));
  register32 register11(.q(registers[11]),.d(WriteData),.wrenable(registerSelect[11]),.clk(Clk));
  register32 register12(.q(registers[12]),.d(WriteData),.wrenable(registerSelect[12]),.clk(Clk));
  register32 register13(.q(registers[13]),.d(WriteData),.wrenable(registerSelect[13]),.clk(Clk));
  register32 register14(.q(registers[14]),.d(WriteData),.wrenable(registerSelect[14]),.clk(Clk));
  register32 register15(.q(registers[15]),.d(WriteData),.wrenable(registerSelect[15]),.clk(Clk));
  register32 register16(.q(registers[16]),.d(WriteData),.wrenable(registerSelect[16]),.clk(Clk));
  register32 register17(.q(registers[17]),.d(WriteData),.wrenable(registerSelect[17]),.clk(Clk));
  register32 register18(.q(registers[18]),.d(WriteData),.wrenable(registerSelect[18]),.clk(Clk));
  register32 register19(.q(registers[19]),.d(WriteData),.wrenable(registerSelect[19]),.clk(Clk));
  register32 register20(.q(registers[20]),.d(WriteData),.wrenable(registerSelect[20]),.clk(Clk));
  register32 register21(.q(registers[21]),.d(WriteData),.wrenable(registerSelect[21]),.clk(Clk));
  register32 register22(.q(registers[22]),.d(WriteData),.wrenable(registerSelect[22]),.clk(Clk));
  register32 register23(.q(registers[23]),.d(WriteData),.wrenable(registerSelect[23]),.clk(Clk));
  register32 register24(.q(registers[24]),.d(WriteData),.wrenable(registerSelect[24]),.clk(Clk));
  register32 register25(.q(registers[25]),.d(WriteData),.wrenable(registerSelect[25]),.clk(Clk));
  register32 register26(.q(registers[26]),.d(WriteData),.wrenable(registerSelect[26]),.clk(Clk));
  register32 register27(.q(registers[27]),.d(WriteData),.wrenable(registerSelect[27]),.clk(Clk));
  register32 register28(.q(registers[28]),.d(WriteData),.wrenable(registerSelect[28]),.clk(Clk));
  register32 register29(.q(registers[29]),.d(WriteData),.wrenable(registerSelect[29]),.clk(Clk));
  register32 register30(.q(registers[30]),.d(WriteData),.wrenable(registerSelect[30]),.clk(Clk));
  register32 register31(.q(registers[31]),.d(WriteData),.wrenable(registerSelect[31]),.clk(Clk));

  // read from the specified registers using mux32to1by32 mux's
  // inputs into the stratosphere!
  mux32to1by32 mux1(.out(ReadData1),.address(ReadRegister1),.input0(registers[0]),.input1(registers[1]),.input2(registers[2]),.input3(registers[3]),.input4(registers[4]),.input5(registers[5]),.input6(registers[6]),.input7(registers[7]),.input8(registers[8]),.input9(registers[9]),.input10(registers[10]),.input11(registers[11]),.input12(registers[12]),.input13(registers[13]),.input14(registers[14]),.input15(registers[15]),.input16(registers[16]),.input17(registers[17]),.input18(registers[18]),.input19(registers[19]),.input20(registers[20]),.input21(registers[21]),.input22(registers[22]),.input23(registers[23]),.input24(registers[24]),.input25(registers[25]),.input26(registers[26]),.input27(registers[27]),.input28(registers[28]),.input29(registers[29]),.input30(registers[30]),.input31(registers[31]));
  mux32to1by32 mux2(.out(ReadData1),.address(ReadRegister2),.input0(registers[0]),.input1(registers[1]),.input2(registers[2]),.input3(registers[3]),.input4(registers[4]),.input5(registers[5]),.input6(registers[6]),.input7(registers[7]),.input8(registers[8]),.input9(registers[9]),.input10(registers[10]),.input11(registers[11]),.input12(registers[12]),.input13(registers[13]),.input14(registers[14]),.input15(registers[15]),.input16(registers[16]),.input17(registers[17]),.input18(registers[18]),.input19(registers[19]),.input20(registers[20]),.input21(registers[21]),.input22(registers[22]),.input23(registers[23]),.input24(registers[24]),.input25(registers[25]),.input26(registers[26]),.input27(registers[27]),.input28(registers[28]),.input29(registers[29]),.input30(registers[30]),.input31(registers[31]));

endmodule