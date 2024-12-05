package package_decode;
//my code for scoreboard
    //RV32I

          //LUI
                localparam MASK_LUI = 32'h0000007f;
                localparam EXPT_LUI = 32'h00000037;

          //AUIPC
                localparam MASK_AUIPC = 32'h0000007f;
                localparam EXPT_AUIPC = 32'h00000017;

          //JAL
                localparam MASK_JAL = 32'h0000007f;
                localparam EXPT_JAL = 32'h0000006f;

          //JALR
                localparam MASK_JALR = 32'h0000707f;
                localparam EXPT_JALR = 32'h00000067;

          //BEQ
                localparam MASK_BEQ = 32'h0000707f;
                localparam EXPT_BEQ = 32'h00000063;

          //BNE
                localparam MASK_BNE = 32'h0000707f;
                localparam EXPT_BNE = 32'h00001063;

          //BLT
                localparam MASK_BLT = 32'h0000707f;
                localparam EXPT_BLT = 32'h00004063;

          //BGE
                localparam MASK_BGE = 32'h0000707f;
                localparam EXPT_BGE = 32'h00005063;

          //BLTU
                localparam MASK_BLTU = 32'h0000707f;
                localparam EXPT_BLTU = 32'h00006063;

          //BGEU
                localparam MASK_BGEU = 32'h0000707f;
                localparam EXPT_BGEU = 32'h00007063;

          //LB
                localparam MASK_LB = 32'h0000707f;
                localparam EXPT_LB = 32'h00000003;

          //LH
                localparam MASK_LH = 32'h0000707f;
                localparam EXPT_LH = 32'h00001003;

          //LW
                localparam MASK_LW = 32'h0000707f;
                localparam EXPT_LW = 32'h00002003;

          //LBU
                localparam MASK_LBU = 32'h0000707f;
                localparam EXPT_LBU = 32'h00004003;

          //LHU
                localparam MASK_LHU = 32'h0000707f;
                localparam EXPT_LHU = 32'h00005003;

          //SB
                localparam MASK_SB = 32'h0000707f;
                localparam EXPT_SB = 32'h00000023;

          //SH
                localparam MASK_SH = 32'h0000707f;
                localparam EXPT_SH = 32'h00001023;

          //SW
                localparam MASK_SW = 32'h0000707f;
                localparam EXPT_SW = 32'h00002023;

          //ADDI
                localparam MASK_ADDI = 32'h0000707f;
                localparam EXPT_ADDI = 32'h00000013;

          //SLTI
                localparam MASK_SLTI = 32'h0000707f;
                localparam EXPT_SLTI = 32'h00002013;

          //SLTIU
                localparam MASK_SLTIU = 32'h0000707f;
                localparam EXPT_SLTIU = 32'h00003013;

          //XORI
                localparam MASK_XORI = 32'h0000707f;
                localparam EXPT_XORI = 32'h00004013;

          //ORI
                localparam MASK_ORI = 32'h0000707f;
                localparam EXPT_ORI = 32'h00006013;

          //ANDI
                localparam MASK_ANDI = 32'h0000707f;
                localparam EXPT_ANDI = 32'h00007013;

          //SLLI32
                localparam MASK_SLLI32 = 32'hfe00707f;
                localparam EXPT_SLLI32 = 32'h00001013;

          //SRLI32
                localparam MASK_SRLI32 = 32'hfe00707f;
                localparam EXPT_SRLI32 = 32'h00005013;

          //SRAI32
                localparam MASK_SRAI32 = 32'hfe00707f;
                localparam EXPT_SRAI32 = 32'h40005013;

          //ADD
                localparam MASK_ADD = 32'hfe00707f;
                localparam EXPT_ADD = 32'h00000033;

          //SUB
                localparam MASK_SUB = 32'hfe00707f;
                localparam EXPT_SUB = 32'h40000033;

          //SLL
                localparam MASK_SLL = 32'hfe00707f;
                localparam EXPT_SLL = 32'h00001033;

          //SLT
                localparam MASK_SLT = 32'hfe00707f;
                localparam EXPT_SLT = 32'h00002033;

          //SLTU
                localparam MASK_SLTU = 32'hfe00707f;
                localparam EXPT_SLTU = 32'h00003033;

          //XOR
                localparam MASK_XOR = 32'hfe00707f;
                localparam EXPT_XOR = 32'h00004033;

          //SRL
                localparam MASK_SRL = 32'hfe00707f;
                localparam EXPT_SRL = 32'h00005033;

          //SRA
                localparam MASK_SRA = 32'hfe00707f;
                localparam EXPT_SRA = 32'h40005033;

          //OR
                localparam MASK_OR = 32'hfe00707f;
                localparam EXPT_OR = 32'h00006033;

          //AND
                localparam MASK_AND = 32'hfe00707f;
                localparam EXPT_AND = 32'h00007033;

          //FENCE
                localparam MASK_FENCE = 32'h0000707f;
                localparam EXPT_FENCE = 32'h0000000f;

          //ECALL
                localparam MASK_ECALL = 32'hffffffff;
                localparam EXPT_ECALL = 32'h00000073;

          //EBREAK
                localparam MASK_EBREAK = 32'hffffffff;
                localparam EXPT_EBREAK = 32'h00100073;

endpackage
