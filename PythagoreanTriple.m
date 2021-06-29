function Output = PythagoreanTriple(LB,UB)
v = LB:1:UB;
c = nchoosek(v,3);
TotCombNum = size(c,1);
Output = zeros(TotCombNum,3);

for i = 1:TotCombNum
    SumOne = c(i,1)^2 + c(i,2)^2; 
    SumTwo = c(i,3)^2;
    if  SumOne == SumTwo
        Output(i,:) = c(i,:);
    else
        Output(i,:) = 0;
    end
end
    ZeroIndicator = Output(:,1)==0;
    Output = Output(~ZeroIndicator,:);
    
NumOfPTSet = size(Output,1);
GCDset = zeros(NumOfPTSet,1);
for i = 1:NumOfPTSet
    A = sym(Output(i,:));
    GCDset(i,1) = gcd(A);
end
RootIndicator = GCDset(:,1)==1;
Output = Output(RootIndicator,:);
end