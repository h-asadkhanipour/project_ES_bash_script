# How to archive ES analysis?
- there is a lot of files that can be removed for storage efficiency.  
- report of fastqc should be save for future reference. ( before and after fastp)  
- bam file should be converted to CRAM accourding to following instructions:  
    - after_bqsr.bam is the final bam before variant calling  
    - convert bam to CRAM with samtools:
        - samtools view -O cram,level=6 after_bqsr.bam -o after_bqsr.cram  
    - all bam and sam files should be removed
    - all reports should be archived
- annotated vcf should be removed because annotation is updating  
    - all filtering results should be removed  
    - all panels and suspicious variants should be archived
- after-vqsr-snp.vcf should be archived
- patient phnotype should be archived    
- final report should be archived  

