# Benchmarking Logger, Lager and inspect

| Name                        |        ips    |    average  | deviation  |        median  |       99th %  |
|-----------------------------|--------------:|------------:|-----------:|---------------:|--------------:|
| Logger inspect int fn       |  1310.60 K    |    0.76 μs  | ±1855.73%  |       0.29 μs  |      6.85 μs  |
| Logger format int           |  1015.78 K    |    0.99 μs  | ±5575.46%  |       0.30 μs  |      7.40 μs  |
| Logger base                 |   701.77 K    |    1.43 μs  |±19616.70%  |          0 μs  |         4 μs  |
| Logger inspect int          |   504.85 K    |    1.98 μs  |±13175.69%  |          0 μs  |         7 μs  |
| Logger format complex       |   158.72 K    |    6.30 μs  | ±2054.35%  |          0 μs  |        52 μs  |
| Logger inspect complex fn   |   111.12 K    |    9.00 μs  | ±6066.54%  |          0 μs  |        62 μs  |
| Logger inspect complex      |    32.37 K    |   30.89 μs  |  ±374.59%  |         26 μs  |        93 μs  |
| Lager format int            |    29.11 K    |   34.36 μs  | ±2943.04%  |          6 μs  |       789 μs  |
| Lager base                  |    28.21 K    |   35.45 μs  | ±3572.71%  |          6 μs  |       931 μs  |
| Lager inspect int           |    27.51 K    |   36.35 μs  | ±1646.62%  |          8 μs  |       858 μs  |
| Lager format complex        |    18.74 K    |   53.35 μs  | ±4667.37%  |         15 μs  |    633.86 μs  |
| Lager inspect complex       |     9.91 K    |  100.88 μs  | ±6523.37%  |         40 μs  |       139 μs  |

Comparison: 
```
Logger inspect int fn         1310.60 K
Logger format int             1015.78 K - 1.29x slower
Logger base                    701.77 K - 1.87x slower
Logger inspect int             504.85 K - 2.60x slower
Logger format complex          158.72 K - 8.26x slower
Logger inspect complex fn      111.12 K - 11.79x slower
Logger inspect complex          32.37 K - 40.49x slower
Lager format int                29.11 K - 45.03x slower
Lager base                      28.21 K - 46.47x slower
Lager inspect int               27.51 K - 47.65x slower
Lager format complex            18.74 K - 69.92x slower
Lager inspect complex            9.91 K - 132.21x slower
```
