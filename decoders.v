// 32 bit decoder with enable signal
//   enable=0: all output bits are 0
//   enable=1: out[address] is 1, all other outputs are 0
module decoder1to32
(
output[31:0]	out,
input		enable,
input[4:0]	address
);

    assign out = enable<<address; 

endmodule

/*
/ << is the bitshift operator.
/ 
/ The enable bit (either 1 or 0) is bitshifted address number of times. For example,
/ adress=00011, enable=1 would result in 3 bit shifts:
/ 
/ out=000000000000000000000000000001  //starting bit
/ out=000000000000000000000000000010  //shift 1
/ out=000000000000000000000000000100  //shift 2
/ out=000000000000000000000000001000  //shift 3
/ 
*/