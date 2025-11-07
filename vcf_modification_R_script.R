# Required library
library("tidyr")


# Loading data
annotated_vcf <- Sys.getenv("annotated_vcf")
modified_vcf <- Sys.getenv("modified_vcf")
vcf <- read.delim(file =annotated_vcf, header = T)


# Separate last column (otherinfo13) into 5 columns 
vcf <- vcf |>
  separate(Otherinfo13, into = c("genotype", 
                                 "allele.depth", 
                                 "depth", 
                                 "genotype.quality", 
                                 "PL"), 
           sep = "[:]")
 
#
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
              "REGENERON_ALL_AF",
              "REGENERON_ALL_AC",
              "REGENERON_ALL_AN",
              "gvs_all_af",
              "gvs_max_af",
              "avsnp151",
              "CLNDN",
              "CLNREVSTAT",
              "CLNSIG",
              "ONCDN",
              "VEST4_score",
              "REVEL_score",
              "REVEL",
              "BayesDel_noAF_score",
              "AlphaMissense_score",
              "CADD_phred",
              "MutPred_score",
              "Otherinfo10",
              "genotype",
              "allele.depth",
              "depth",
              "genotype.quality",
              "InterVar_automated",
              "BA1",
              "BS1",
              "BS2"
              )]


# Save it
write.table(vcf,file = modified_vcf,sep = "\t", quote = F, row.names = F)



# annotated vcf header column names 


# Chr	Start	End	Ref	Alt	Func.refGene	Gene.refGene	GeneDetail.refGene	ExonicFunc.refGene	AAChange.refGene	Xref.refGene	Func.knownGene	Gene.knownGene	GeneDetail.knownGene	ExonicFunc.knownGene	AAChange.knownGene	Func.ensGene	Gene.ensGene	GeneDetail.ensGene	ExonicFunc.ensGene	AAChange.ensGene	SIFT_score	SIFT_converted_rankscore	SIFT_pred	SIFT4G_score	SIFT4G_converted_rankscore	SIFT4G_pred	Polyphen2_HDIV_score	Polyphen2_HDIV_rankscore	Polyphen2_HDIV_pred	Polyphen2_HVAR_score	Polyphen2_HVAR_rankscore	Polyphen2_HVAR_pred	LRT_score	LRT_converted_rankscore	LRT_pred	LRT_Omega	MutationTaster_score	MutationTaster_converted_rankscore	MutationTaster_pred	MutationAssessor_score	MutationAssessor_rankscore	MutationAssessor_pred	FATHMM_score	FATHMM_converted_rankscore	FATHMM_pred	PROVEAN_score	PROVEAN_converted_rankscore	PROVEAN_pred	VEST4_score	VEST4_rankscore	MetaSVM_score	MetaSVM_rankscore	MetaSVM_pred	MetaLR_score	MetaLR_rankscore	MetaLR_pred	Reliability_index	MetaRNN_score	MetaRNN_rankscore	MetaRNN_pred	M-CAP_score	M-CAP_rankscore	M-CAP_pred	REVEL_score	REVEL_rankscore	MutPred_score	MutPred_rankscore	MVP_score	MVP_rankscore	gMVP_score	gMVP_rankscore	MPC_score	MPC_rankscore	PrimateAI_score	PrimateAI_rankscore	PrimateAI_pred	DEOGEN2_score	DEOGEN2_rankscore	DEOGEN2_pred	BayesDel_addAF_score	BayesDel_addAF_rankscore	BayesDel_addAF_pred	BayesDel_noAF_score	BayesDel_noAF_rankscore	BayesDel_noAF_pred	ClinPred_score	ClinPred_rankscore	ClinPred_pred	LIST-S2_score	LIST-S2_rankscore	LIST-S2_pred	VARITY_R_score	VARITY_R_rankscore	VARITY_ER_score	VARITY_ER_rankscore	VARITY_R_LOO_score	VARITY_R_LOO_rankscore	VARITY_ER_LOO_score	VARITY_ER_LOO_rankscore	ESM1b_score	ESM1b_rankscore	ESM1b_pred	EVE_score	EVE_rankscore	AlphaMissense_score	AlphaMissense_rankscore	AlphaMissense_pred	Aloft_pred	Aloft_Confidence	CADD_raw	CADD_raw_rankscore	CADD_phred	DANN_score	DANN_rankscore	fathmm-MKL_coding_score	fathmm-MKL_coding_rankscore	fathmm-MKL_coding_pred	fathmm-MKL_coding_group	fathmm-XF_coding_score	fathmm-XF_coding_rankscore	fathmm-XF_coding_pred	Eigen-raw_coding	Eigen-raw_coding_rankscore	Eigen-phred_coding	Eigen-PC-raw_coding	Eigen-PC-raw_coding_rankscore	Eigen-PC-phred_coding	GenoCanyon_score	GenoCanyon_rankscore	integrated_fitCons_score	integrated_fitCons_rankscore	integrated_confidence_value	GM12878_fitCons_score	GM12878_fitCons_rankscore	GM12878_confidence_value	H1-hESC_fitCons_score	H1-hESC_fitCons_rankscore	H1-hESC_confidence_value	HUVEC_fitCons_score	HUVEC_fitCons_rankscore	HUVEC_confidence_value	LINSIGHT	LINSIGHT_rankscore	GERP++_NR	GERP++_RS	GERP++_RS_rankscore	phyloP100way_vertebrate	phyloP100way_vertebrate_rankscore	phyloP470way_mammalian	phyloP470way_mammalian_rankscore	phyloP17way_primate	phyloP17way_primate_rankscore	phastCons100way_vertebrate	phastCons100way_vertebrate_rankscore	phastCons470way_mammalian	phastCons470way_mammalian_rankscore	phastCons17way_primate	phastCons17way_primate_rankscore	SiPhy_29way_pi	SiPhy_29way_logOdds	SiPhy_29way_logOdds_rankscore	bStatistic	bStatistic_converted_rankscore	Interpro_domain	GTEx_V8_eQTL_gene	GTEx_V8_eQTL_tissue	GTEx_V8_sQTL_gene	GTEx_V8_sQTL_tissue	eQTLGen_snp_id	InterVar_automated	PVS1	PS1	PS2	PS3	PS4	PM1	PM2	PM3	PM4	PM5	PM6	PP1	PP2	PP3	PP4	PP5	BA1	BS1	BS2	BS3	BS4	BP1	BP2	BP3	BP4	BP5	BP6	BP7	ID	Consequence	SYMBOL	Gene	Feature	HGVSp	AA_pos	Ref_aa	Alt_aa	prediction	LoGoFunc_neutral	LoGoFunc_GOF	LoGoFunc_LOF	gnomad41_exome_AF	gnomad41_exome_AF_raw	gnomad41_exome_AF_XX	gnomad41_exome_AF_XY	gnomad41_exome_AF_grpmax	gnomad41_exome_faf95	gnomad41_exome_faf99	gnomad41_exome_fafmax_faf95_max	gnomad41_exome_fafmax_faf99_max	gnomad41_exome_AF_afr	gnomad41_exome_AF_amr	gnomad41_exome_AF_asj	gnomad41_exome_AF_eas	gnomad41_exome_AF_fin	gnomad41_exome_AF_mid	gnomad41_exome_AF_nfe	gnomad41_exome_AF_remaining	gnomad41_exome_AF_sas	REGENERON_ALL_AF	REGENERON_ALL_AC	REGENERON_ALL_AN	gvs_all_af	gvs_max_af	gvs_afr_af	gvs_amr_af	gvs_eas_af	gvs_eur_af	gvs_mid_af	gvs_oth_af	gvs_sas_af	REVEL	avsnp151	CLNALLELEID	CLNDN	CLNDISDB	CLNREVSTAT	CLNSIG	ONCDN	ONCDISDB	ONCREVSTAT	ONC	SCIDN	SCIDISDB	SCIREVSTAT	SCI	Otherinfo1	Otherinfo2	Otherinfo3	Otherinfo4	Otherinfo5	Otherinfo6	Otherinfo7	Otherinfo8	Otherinfo9	Otherinfo10	Otherinfo11	Otherinfo12	Otherinfo13

