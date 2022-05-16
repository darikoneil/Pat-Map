ID = zeros(1,33642);
traceIntervakk = round(traceIntervall);
trace1 = Trial1(traceIntervall);
trace2 = Trial2(traceIntervall);
trace3 = Trial3(traceIntervall);

traceTrace = round([trace1; trace2; trace3]);

ID(traceTrace)=1;
