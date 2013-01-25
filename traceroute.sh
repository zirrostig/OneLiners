#!/bin/zsh

for i in {1..$2}; do
    ping -c1 -t$i $1 &;
done | awk '/From/ {res += 1;   if ($3 ~ /icmp_seq/) {
                                    printf "%2d  %-30s\n", res, $2
                                }
                                else {
                                    printf "%2d  %-30s %-40s\n", res, $3, $2
                                }
                   }
            /from/ {if (done != 1) {
                            done = 1;
                            printf "%2d  %-30s %-40s\n", res + 1, $5, $4
                        }
                    }'
