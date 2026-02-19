# SWAP Test

> **Category**: simulation &nbsp;|&nbsp; **Difficulty**: intermediate &nbsp;|&nbsp; **Qubits**: 3 &nbsp;|&nbsp; **Gates**: 4 &nbsp;|&nbsp; **Depth**: 4

The SWAP test non-destructively estimates the overlap |⟨ψ|φ⟩|² of two quantum states. An ancilla qubit in superposition controls a SWAP between the two state registers. P(ancilla=1) = (1 - |⟨ψ|φ⟩|²)/2. For identical states: P(1)=0, for orthogonal: P(1)=0.5. This circuit tests |ψ⟩=|0⟩ vs |φ⟩=|+⟩, so |⟨0|+⟩|²=0.5 → P(1) = 0.25.

## Expected Output

P(1) ≈ 0.25 (|⟨0|+⟩|² = 0.5 → P(1) = (1-0.5)/2 = 0.25)

## Circuit

The OpenQASM 2.0 circuit is in [`circuit.qasm`](./circuit.qasm).

```
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
```

## Tags

`swap-test` `state-overlap` `fidelity` `ancilla`

## References

- [Buhrman et al. (2001). Quantum Fingerprinting. PRL 87, 167902](https://doi.org/10.1103/PhysRevLett.87.167902)

## License

MIT — part of the [OpenQC Algorithm Catalog](https://github.com/openqc-algorithms).
