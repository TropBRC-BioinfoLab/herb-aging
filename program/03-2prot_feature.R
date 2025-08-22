library(protr)
library(comprehenr)

# FEATURE EXTRACTION
aac_list <- list()
dc_list <- list()
pssm_list <- list()

idx = as.numeric(1)
setwd('/Users/putri/OneDrive/Documents/Semester 6/MPTP/Skripsi Things/Program/')
getwd()
path = 'data/Prot/'

for (i in list.files(path)) {
  aac_list[[idx]] <- extractAAC(readFASTA(paste(path, i, sep=''))[[1]])
  dc_list[[idx]] <- extractDC(readFASTA(paste(path, i, sep=''))[[1]])
  idx = idx + 1
}

df_aac <- data.frame(matrix(unlist(aac_list), nrow=length(aac_list)))
head(df_aac)
colnames(df_aac) <- to_vec(for(i in 1:20) paste("aac", i, sep='_'))
head(df_aac)

df_dc <- data.frame(matrix(unlist(dc_list), nrow=length(dc_list)))
head(df_dc)
colnames(df_dc) <- to_vec(for(i in 1:400) paste("dc", i, sep='_'))
head(df_dc)

list.files(path)
uniprot_id <- c("BCL2","BECN1","CDN2A","IGF1","KLOT","SIR1","SIR2","SIR3","SIR4","SIR5")
df_aac$uniprot_id <- uniprot_id
df_dc$uniprot_id <- uniprot_id

# SAVE THE FILES
write.csv(df_aac, 'protein_aac.csv', row.names=FALSE)
write.csv(df_dc, 'protein_dc.csv', row.names=FALSE)