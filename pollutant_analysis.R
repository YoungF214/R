## 1
Pollutantmean <- function(directory, pollutant, id = 1:332) {
        files <- list.files(directory, full.names = TRUE)
        x <- data.frame()
        for (i in id) {
                x <- rbind(x, read.csv(files[i]))
        }
        mean(x[, pollutant], na.rm = TRUE)
        
}
Pollutantmean("specdata", "nitrate", 23)
Pollutantmean("specdata", "nitrate", 70:72)
Pollutantmean("specdata", "sulfate", 1:10)
Pollutantmean("specdata", "sulfate", 34)


## 2
complete <- function(directory, id = 1:332) {
        files <- list.files(directory, full.names = TRUE)
        nobs <- numeric()
        for (i in id) {
            nobs <- c(nobs, sum(complete.cases(read.csv(files[i]))))
        }
        data.frame(id, nobs)
}
complete("specdata", c(2,4,8,10,12))
complete("specdata", 30:25)
complete("specdata", 3)

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])


## 3
corr <- function(directory, threshold = 0) {
        files <- list.files(directory, full.names = TRUE)
        x = complete(directory)
        ids = x[x["nobs"] > threshold, ]$id
        co = numeric()
        
        for (i in ids) {
                y = read.csv(files[i])
                z = y[complete.cases(y), ]
                co = c(co, cor(z$sulfate, z$nitrate))
        }
        return(co)
}

cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))

