# Required library
library("tidyr")


# Loading data
annotated_vcf <- Sys.getenv("annotated_vcf")
modified_vcf <- Sys.getenv("modified_vcf")
vcf <- read.delim(file =annotated_vcf, header = T)


# Separate last column (otherinfo13) into 5 columns 
vcf <- vcf %>% 
  separate(Otherinfo13, into = c("genotype", "allele.depth", "depth", "genotype.quality", "PL"), sep = "[:]")
 

# Select columns that you want to keep ( columns order in modified vcf is as you put here )
vcf <- vcf[,c("Chr",
              "Start",
              "End",
              "Ref",
              "Alt",
              "ExonicFunc.refGene",
              "AAChange.refGene",
              "Gene.refGene",
              "Gene.knownGene",
              "Gene.ensGene",
              "Func.refGene",
              "Func.knownGene",
              "Func.ensGene",
              "Xref.refGene",
              "gnomad41_exome_AF",
              "gnomad41_exome_AF_grpmax",
              "CLNDN",
              "CLNREVSTAT",
              "CLNSIG",
              "avsnp151",
              "REVEL_score",
              "VEST4_score",
              "BayesDel_noAF_score",
              "AlphaMissense_score",
              "CADD_phred",
              "Otherinfo10",
              "genotype",
              "allele.depth",
              "depth",
              "genotype.quality"
              )]

# Save it
write.table(vcf,file = modified_vcf,sep = "\t", quote = F, row.names = F)

