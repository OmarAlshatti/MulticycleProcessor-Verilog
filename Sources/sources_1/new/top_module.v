`timescale 1ns / 1ps

module top_module(CLK,RST);
    input CLK,RST;
    wire [4:0] rt,rd,RFWA,shamt,RFRA1,RFRA2;
    wire [15:0] unextended;
    wire [5:0] Opcode;
      wire [2:0] ALUOp,PCSel,ALUIn2Sel;
      wire [1:0] MWE,IRWE,IDSel,RFDSel,MtoRFSel,PCWE,PCbranch,PCEn,ALUIn1Sel,RFWE,Zero,Branch,jump;
      wire [3:0] ALUInSel;
      wire [6:0] Funct;
      wire [8:0] MRA;
       wire [31:0] ALUIn1,ALUIn2,ALUOut,ALUOutSR,
        
        MWD,
        MRD,
        IR,
         PCOut,
        ALUOutR, Adr,
        
        RFWD,
        A,B,
        
      
        RFRD1,RFRD2,
        extended
        ;
    ALU ALU1(.ALUInSel(ALUInSel), .ALUIn1(ALUIn1), .ALUIn2(ALUIn2), .ALUOut(ALUOut), .Zero(Zero),.shamt(IR[10:6]),.CLK(CLK),.ALUOutSR(ALUOutSR));
    
    ALUCtrl ALUC1(.ALUInSel(ALUInSel), .ALUOp(ALUOp), .Funct(IR[5:0]));
    
    DM DM1 (.CLK(CLK), .MRA(Adr),.MRD(MRD),.MWE(MWE),.MWD(B),.IRWE(IRWE),.IR(IR));
    
    //DR DR1 (CLK,MRD,MRD);
    //IR IR1(CLK,IR,MRD,IRWE);
    
    Mux1 M1(.IDSel(IDSel),.PCOut(PCOut),.ALUOut(ALUOut),.Adr(Adr));
    
    Mux2 M2(.RFWA(RFWA),.RFDSel(RFDSel),.rt(IR[20:16]),.rd(IR[15:11]),.IRWE(IRWE));
    
    Mux3 M3(MRD, ALUOut, MtoRFSel,RFWD);
    
    mux4 M4(ALUIn1Sel,A,PCOut,ALUIn1);
    
    Mux5 M5(ALUIn2Sel,B,extended,ALUIn2);
    
    Mux6 M6(.ALUOut(ALUOut),.ALUOutR(ALUOutR),.Jaddr(IR[25:0]),.PCSel(PCSel),.ALUOutSR(ALUOutSR));
    
    ORgate OR1(PCEn,PCWE,PCbranch);
    
    //PC PC1(CLK,RST,ALUOut,PCOut,PCEn);
    PC PC1(.CLK(CLK),.RST(RST),.ALUOut(ALUOut),.PCOut(PCOut),.PCEn(PCEn),.jump(jump),.Jaddr(IR[25:0]));
    RF RF0(.RFRA1(IR[25:21]), .RFRA2(IR[20:16]), .CLK(CLK), .RFWA(RFWA), .RFWD(RFWD),.RFRD1(RFRD1),.RFRD2(RFRD2),.RFWE(RFWE));
    
    RF_reg RFR1(RFRD1,RFRD2,A,B,CLK);
    
     Simm Simm0(.unextended(IR[15:0]), .extended(extended));
     
     zero_and Z1(.Branch(Branch), .Zero(Zero),.PCbranch(PCbranch));
     
     control_unit CU1(.Opcode(IR[31:26]), .RFWE(RFWE),.Branch(Branch),.MWE(MWE),. MtoRFSel(MtoRFSel),.ALUOp(ALUOp),
     .RST(RST),.CLK(CLK),.IDSel(IDSel),.PCSel(PCSel),.ALUIn1Sel(ALUIn1Sel),.ALUIn2Sel(ALUIn2Sel),.IRWE(IRWE),.jump(jump),.RFDSel(RFDSel),.PCWE(PCWE));
endmodule
