#!/bin/sh

( sleep 2; cat /proc/stat ) | cat /proc/stat - |
    awk '   /cpu / { oldsum = sum; sum = 0;
                     for ( i = 2; i <= NF; i++ ) { sum += $i };
                     oldidle = idle;
                     idle = $5;
                     diffsum = sum - oldsum;
                     diffidle = idle - oldidle;
                     usage = (( diffsum - diffidle ) / diffsum ) * 100} 
            END    { print usage }'
