run_project <- function() {
        library(dplyr)
        
        ## Read data from computer
        
        data_test<-read.table(".\\test\\X_test.txt")
        labels_test<-read.table(".\\test\\y_test.txt")
        subject_test<-read.table(".\\test\\subject_test.txt")
        data_train<-read.table(".\\train\\X_train.txt")
        labels_train<-read.table(".\\train\\y_train.txt")
        subject_train<-read.table(".\\train\\subject_train.txt")
        variables<-read.table("features.txt")
        activities<-read.table("activity_labels.txt")
        
        #label de datasets
        names(data_test)<-variables[,2]
        names(data_train)<-variables[,2]
       
        #store only columns with mean or std 
        nvar<-nrow(variables)
        data_test_f<-data_test[,1:6]
        data_train_f<-data_train[,1:6]
        for (i in 7:nvar){
                if (isTRUE(grep("mean",variables[i,2],ignore.case=TRUE)==c(1))||
                            isTRUE(grep("std",variables[i,2],ignore.case=TRUE)==c(1))){
                        
                        data_test_f<-data.frame(data_test_f,data_test[,i])
                        data_train_f<-data.frame(data_train_f,data_train[,i])
                            }
                
        }
        # assign names of activities to lables_test and labels_train
        activ<-data.frame(activiti=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                          "SITTING","STANDING","LAYING"),stringsAsFactors=FALSE)
        #labels_test2<-data.frame(activiti=character(),stringsAsFactors=FALSE)
        labels_test_f<-labels_test
        labels_train_f<-labels_train
        for (i in 1:nrow(activ)){
                labels_test_f$V1[labels_test$V1==i]<-activ[i,1] 
                labels_train_f$V1[labels_train$V1==i]<-activ[i,1]
        }
       
        # add 2 columns at left with labels and subjects
        data_test_f<-data.frame(labels_test_f[,1],subject_test[,1],data_test_f)
        data_train_f<-data.frame(labels_train_f[,1],subject_train[,1],data_train_f)

        #bind the two tables
        names(data_train_f)<-names(data_test_f)
        data_fin<-rbind(data_test_f,data_train_f)
        #split by activity and by user
        sumari<-split(data_fin,list(data_fin[,1],data_fin[,2]))
        #calculate means and put in a data frame
        result<-data.frame(lapply(sumari, function(x) colMeans(x[,3:88])))
        result<-t(result)
        #write to a txt file
        write.table(result,"resultat.txt",row.name=FALSE)
}
