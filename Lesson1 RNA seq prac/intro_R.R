2+2 #testing R
print("hellow world")
getwd() #see work directory
print()
library(tidyverse)
      #read_csv() for csv comma-separated
      #read_tsv() for tab-separated csv

#read in counts file, counts= objective
counts <- read_csv("data/GSE60450_GeneLevel_Normalized(CPM.and.TMM)_data.csv")
      #col_double= numbers

#read in metadata
sampleinfo <- read_csv("data/GSE60450_filtered_metadata.csv")
  #col_charac= text character

sampleinfo #print info
dim(sampleinfo) # row*column
head(sampleinfo) #first 6 lines
tail(sampleinfo) #last 6 lines
view(sampleinfo) # same as open "sampleinfo" in env
colnames(sampleinfo) #see the name of each column
sampleinfo$X1 #see the individual column
sampleinfo$X1[1:3] #see the first 3 items in column X1
str(sampleinfo) #sturcture of the sample
summary(counts)
head(sampleinfo, n=8)
?head #find help about the function head
subset_counts <- head(counts, n=20)
subset_counts
subset_counts$GSM1480291
?mean

#fornat the data
#convert from wide to long format
seqdata <- pivot_longer(counts, 
                        cols = starts_with("GSM"), 
                        names_to = "Sample", 
                        values_to = "Count")
      #cols= reformat the cell that start w "GSM"
      #the name of the col to be in "Sample" column
      #the value of each to be in "Count" column

#alternative way
seqdata1 <- pivot_longer(counts, cols = -c("X1", "gene_symbol"), names_to = "Sample", values_to = "Count")
      # '-' is for excluding what we dont want
      # c()= function for combining multiple items

#combing 2 tables
allinfo <- full_join(seqdata, sampleinfo, by = c("Sample"="X1"))
allinfo

ggplot(data = allinfo, 
       mapping = aes(x = Sample, 
                     y = log2(Count+1), 
                     fill = Sample)
       ) + #the "+" sign has to be in the last
  geom_boxplot()
      #use log2 for better visualisation
      #count+1 to ensure saome RNA reading=0 is included
      #colour is in the aes(), and need to specify what col we want to colour. it colors the line
      #fill only fill in AREAS in ggplot2 plots
?geom_boxplot

ggplot(data = allinfo,
       mapping = aes(x=`developmental stage`, # note the ``, this is requried when there is a space in col name
                     y=log2(Count+1),
                     fill = `developmental stage`)
       ) +
  geom_boxplot()

#make shorter category name
allinfo <- mutate(allinfo, Group = case_when(
  str_detect(characteristics, "basal.*virgin") ~ "bvirg",  
  str_detect(characteristics, "basal.*preg") ~ "bpreg",
  str_detect(characteristics, "basal.*lact") ~ "blact",
  str_detect(characteristics, "luminal.*virgin") ~ "lvirg",
  str_detect(characteristics, "luminal.*preg") ~ "lpreg",
  str_detect(characteristics, "luminal.*lact") ~ "llact"
))
head(allinfo)

#filter for gene of interests
mygenes <- c("Csn1s2a", "Csn1s1", "Csn2", "Glycam1", "COX1", "Trf", "Wap", "Eef1a1")
      #define genes of interets
mygenes_counts <- filter(allinfo, 
                         gene_symbol %in% mygenes)
      #filter()
      #bigger group %in% newobj, use %in% to check mygenes is a subset of bigger group
mygenes_counts

#create plots for each gene
ggplot(data = mygenes_counts, aes(x = Group,
                                  y = log2(Count+1),
                                  colour = Group
)) +
  geom_jitter() +
  facet_wrap(~ gene_symbol,
             nrow = NULL,
             ncol = NULL) +
  scale_color_brewer(palette = "Dark2") +
  labs(x = "Cell type and stage", y = "Count", title = "Mammary gland RNA-seq data") +
  theme(axis.title.y = element_text(angle = 45))
      #facet_wrap is the key for producing individual graph for each gene
      # must add the "~" in front of the facet

#order of categories
group_order <- c("bvirg", "bpreg", "blact", "lvirg", "lpreg", "llact") # 6 levels

mygenes_counts <- mutate(mygenes_counts,
                         Group_f = factor(Group, levels = group_order))
    #add new group Group_f, which is catergorised by group_order
    #Group_f is gen from Group

mygenes_counts %>% select(X1, Group, Group_f) #to select specific col i want
str(mygenes_counts)
levels(mygenes_counts$Group_f)

#using Group_f as the x
pdf("myfirstplot.pdf")
ggplot(mygenes_counts, aes(x = Group_f,
                           y = log2(Count+1),
                           colour = Group_f)) +
  geom_jitter() +
  facet_wrap(~ gene_symbol) +
  scale_color_brewer(palette = "Dark2") +
  labs(x = "Cell type and stage", y = "Counts", title = "Mammary gland RNA-seq data")
dev.off

