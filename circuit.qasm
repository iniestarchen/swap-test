OPENQASM 2.0;
include "qelib1.inc";
// SWAP test: estimate |<psi|phi>|^2
// q[0]: ancilla, q[1]: |psi>=|0>, q[2]: |phi>=|+>
qreg q[3];
creg c[1];
// Prepare |phi> = |+>
h q[2];
// SWAP test
h q[0];
cswap q[0],q[1],q[2];
h q[0];
// P(1) = (1 - |<0|+>|^2) / 2 = (1 - 0.5) / 2 = 0.25
measure q[0] -> c[0];
