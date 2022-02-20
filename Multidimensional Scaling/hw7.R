# Homework 7 Code:

# # First set:
# # Generate Distance Matrix:
# 
# dist_mx1 <- matrix(c(0, 294, 192,	494,	161,	346,	208,
#                   294,	0,	377,	226,	143,	371,	229,
#                   192,	377,	0,	463,	303,	200,	404,
#                   494,	226,	463,	0,	342,	279,	445,
#                   161,	143,	303,	342,	0,	296,	155,
#                   346,	371,	200,	279,	296,	0,	468,
#                   208,	229,	404,	445,	155,	468,	0),
#                   nrow = 7, ncol = 7);
# 
# # Apply MDS with 1-D:
# 
# model1_1 <- cmdscale(dist_mx1, k=1, eig=TRUE);
# plot(model1_1$eig);
# 
# firstset_oneD <- data.frame(model1_1$points, 0);
# plot(firstset_oneD, main="First Set: Model in 1D");
# mylabels <- c(1, 2, 3, 4, 5, 6, 7)
# text(firstset_oneD, labels=mylabels, pos=4)
# 
# # Apply MDS with 2-D
# 
# model1_2 <- cmdscale(dist_mx1, k=2, eig=TRUE);
# plot(model1_2$eig);
# plot(model1_2$points,asp=1, xlim=c(-300,300),
#      ylim=c(-300,300), main="First Set: Model in 2D")
# text(model1_2$points,labels=mylabels,pos=4)
# 
# model_dist <- as.matrix(dist(model1_2$points));
# error_matrix <- dist_mx1 - model_dist;
# abs_error_matrix <- abs(error_matrix);
# largest_error <- max(abs_error_matrix);
# mean_abs_error <- mean(abs_error_matrix);
# 
# # abs_error_data <- abs(as.dist(dist_mx1) - dist(model1_2$points))
# # hist(abs_error_data);
# 
# plot(as.dist(dist_mx1), dist(model1_2$points),asp=1,xlim=c(0,500),ylim=c(0,500), xlab="Original Distances", ylab="Model Distances")
# abline(0,1)
# 
# # Apply MDS with 3-D
# 
# model1_3 <- cmdscale(dist_mx1, k=3, eig=TRUE);
# plot(as.dist(dist_mx1), dist(model1_3$points),asp=1, xlab="Original Distances",xlim=c(0,500),ylim=c(0,500), ylab="Model Distances")
# abline(0, 1)
# 
# model_dist1_3 <- as.matrix(dist(model1_3$points));
# error_matrix1_3 <- dist_mx1 - model_dist1_3;
# abs_error_matrix1_3 <- abs(error_matrix1_3);
# largest_error1_3 <- max(abs_error_matrix1_3);
# mean_abs_error1_3 <- mean(abs_error_matrix1_3);
# 
# # abs_error_data1_3 <- abs(as.dist(dist_mx1) - dist(model1_3$points))
# # hist(abs_error_data1_3);


# ------------------------------------------------------------------------------------------------------------------------------------------------------
# Second set:
# Generate Distance Matrix:

dist_mx2 = matrix(c(0,	11120,	8217,	7359,	9010,	16937,	3782,
                  11120,	0,	6214,	6741,	15936,	6774,	12052,
                  8217,	6214,	0,	1049,	16904,	8729,	6589,
                  7359,	6741,	1049,	0,	16066,	9483,	5783,
                  9010,	15936,	16904,	16066,	0,	14064,	10356,
                  16937,	6774,	8729,	9483,	14064,	0,	14242,
                  3782,	12052,	6589,	5783,	10356,	14242,	0),
                  nrow = 7, ncol = 7);

# # Apply MDS with 1-D:
# 
# model2_1 <- cmdscale(dist_mx2, k=1, eig=TRUE);
# plot(model2_1$eig);
# 
# secondset_oneD <- data.frame(model2_1$points, 0);
# plot(secondset_oneD, main="Second Set: Model in 1D");
# mylabels <- c(1, 2, 3, 4, 5, 6, 7)
# text(secondset_oneD, labels=mylabels, pos=4);

# # Apply MDS with 2-D
# 
# model2_2 <- cmdscale(dist_mx2, k=2, eig=TRUE);
# plot(model2_2$eig);
# plot(model2_2$points,asp=1, xlim=c(-10000,10000),
#      ylim=c(-10000,10000), main="Second Set: Model in 2D")
# mylabels <- c(1, 2, 3, 4, 5, 6, 7);
# text(model2_2$points,labels=mylabels,pos=4)
# 
# model_dist <- as.matrix(dist(model2_2$points));
# error_matrix <- dist_mx2 - model_dist;
# abs_error_matrix <- abs(error_matrix);
# largest_error <- max(abs_error_matrix);
# mean_abs_error <- mean(abs_error_matrix);
# 
# # abs_error_data <- abs(as.dist(dist_mx2) - dist(model2_2$points))
# # hist(abs_error_data);
# 
# plot(as.dist(dist_mx2), dist(model2_2$points),asp=1,xlim=c(0,20000),ylim=c(0,20000), xlab="Original Distances", ylab="Model Distances")
# abline(0,1)
 
# # Apply MDS with 3-D
# 
# model2_3 <- cmdscale(dist_mx2, k=3, eig=TRUE);
# plot(as.dist(dist_mx2), dist(model2_3$points),asp=1, xlab="Original Distances",xlim=c(0,20000),ylim=c(0,20000), ylab="Model Distances")
# abline(0, 1)
# 
# model_dist2_3 <- as.matrix(dist(model2_3$points));
# error_matrix2_3 <- dist_mx2 - model_dist2_3;
# abs_error_matrix2_3 <- abs(error_matrix2_3);
# largest_error2_3 <- max(abs_error_matrix2_3);
# mean_abs_error2_3 <- mean(abs_error_matrix2_3);
# 
# # abs_error_data2_3 <- abs(as.dist(dist_mx2) - dist(model2_3$points))
# # hist(abs_error_data2_3);

