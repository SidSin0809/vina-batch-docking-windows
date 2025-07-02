# vina-batch-docking-windows
High-throughput molecular-docking toolkit for Windows

This repository bundles pre-compiled AutoDock Vina binaries (`vina.exe`, `vina_split.exe`) together with a helper script (`Vina_windows.pl`) and a ligand list (`lig.txt`) so you can screen thousands of PDBQT ligands against a single receptor in one command. The goal is to spare Windows users the usual *nix gymnastics and get productive right away.  

---

## Quick start
# 1 — clone
git clone https://github.com/SidSin0809/vina-batch-docking-windows.git
cd vina-batch-docking-windows

# 2 — prepare receptor & grid box

# 3 — run batch docking
perl scripts/Vina_windows.pl ^
     --receptor example/receptor.pdbqt ^
     --ligand_list data/lig.txt ^
     --config example/conf.txt ^
     --exhaustiveness 16 ^
     --cpu 8


## Requirements
| Component                                          | Minimum version | Why needed                  | Install hint                                                                                                                  |
| -------------------------------------------------- | --------------- | --------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **Windows 10/11 (x64)**                            | —               | Target OS                   | —                                                                                                                             |
| **Microsoft Visual C++ Redistributable 2015-2022** | latest          | runtime libs for `vina.exe` | winget install Microsoft.VCRedist.2015+.x64                                                                                   |
| **Strawberry Perl**                                | 5.32+           | runs `Vina_windows.pl`      | [https://strawberryperl.com/](https://strawberryperl.com/) download installer           |
| **AutoDock Vina binaries**                         | 1.2.x           | docking engine (included)   | compiled from [https://github.com/ccsb-scripps/AutoDock-Vina](https://github.com/ccsb-scripps/AutoDock-Vina) |
| *(Optional)* **Python 3.9+**                       | —               | score parsing, plots        | `pip install pandas matplotlib seaborn numpy`                                                                                 |
| *(Optional)* **Meeko**                             | 0.4+            | advanced ligand prep        | `pip install meeko`                                                                        |

## Outputs
ligand_out.pdbqt – docked poses

ligand.log – affinity in kcal·mol⁻¹

