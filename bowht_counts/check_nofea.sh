#!/bin/bash

# 디렉토리 내 모든 *_counts.txt 파일에 대해 반복
for file in *_counts.txt; do
    # 파일에서 전체 리드 수 계산
    total_reads=$(awk '{s+=$2} END {print s}' "$file")

    # 파일에서 __no_feature 값 추출
    no_feature=$(grep "__no_feature" "$file" | awk '{print $2}')

    # 비율 계산
    no_feature_ratio=$(echo "scale=4; $no_feature / $total_reads" | bc)

    # 결과 출력
    echo "File: $file - Total Reads: $total_reads - No feature ratio: $no_feature_ratio"
done
