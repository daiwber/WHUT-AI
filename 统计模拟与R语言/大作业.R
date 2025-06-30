# 1. 读取数据
data <- read.csv("C:/Users/levon/Desktop/课内实验/统计模拟与R语言/herb.csv", header = TRUE)
# 2. 数据清洗
data$Y <- as.numeric(as.character(data$Y))
data$X1 <- as.numeric(as.character(data$X1))
data$X2 <- as.numeric(as.character(data$X2))
data$X3 <- as.numeric(as.character(data$X3))
data$X4 <- as.numeric(as.character(data$X4))
# 3. 绘制散点图
par(mfrow = c(2, 2)) # 设置图形布局为2行2列
plot(data$X1, data$Y, xlab = "X1", ylab = "Y", main = "Scatterplot of Y vs X1")
abline(lm(Y ~ X1, data = data), col = "red") # 添加趋势线
plot(data$X2, data$Y, xlab = "X2", ylab = "Y", main = "Scatterplot of Y vs X2")
abline(lm(Y ~ X2, data = data), col = "red")
plot(data$X3, data$Y, xlab = "X3", ylab = "Y", main = "Scatterplot of Y vs X3")
abline(lm(Y ~ X3, data = data), col = "red")
plot(data$X4, data$Y, xlab = "X4", ylab = "Y", main = "Scatterplot of Y vs X4")
abline(lm(Y ~ X4, data = data), col = "red")

# 4. 计算相关系数
cor_Y_X1 <- cor(data$Y, data$X1, use = "complete.obs") # 对于缺失或NA值使用complete.obs
cor_Y_X2 <- cor(data$Y, data$X2, use = "complete.obs")
cor_Y_X3 <- cor(data$Y, data$X3, use = "complete.obs")
cor_Y_X4 <- cor(data$Y, data$X4, use = "complete.obs")
# 打印相关系数
print(paste("Correlation between Y and X1:", cor_Y_X1))
print(paste("Correlation between Y and X2:", cor_Y_X2))
print(paste("Correlation between Y and X3:", cor_Y_X3))
print(paste("Correlation between Y and X4:", cor_Y_X4))

# 5. 进行线性回归分析（可选）
# 例如，对Y和X1进行线性回归分析
model_Y_X1 <- lm(Y ~ X1, data = data)
summary(model_Y_X1) # 查看模型摘要和统计检验结果

# 1. 读取数据
data <- read.csv("C:/Users/levon/Desktop/课内实验/统计模拟与R语言/herb.csv", header = TRUE)
# 建立回归模型
model <- lm(Y ~ X1 + X2 + X3 + X4, data = data)
# 查看模型摘要
summary(model)

# 学生化残差
rstandard(model)

# 残差图
plot(resid(model) ~ fitted(model))
abline(h = 0, col = "red")

# 安装并加载lmtest包
install.packages("lmtest")
library(lmtest)

# Breusch-Pagan检验
bptest(model)

# 残差的正态性检验
shapiro.test(resid(model))

# Durbin-Watson检验
dwtest(model)

# 安装并加载car包
install.packages("car")
library(car)

# 方差膨胀因子
vif(model)

# 残差的诊断图
par(mfrow = c(2, 2))
plot(model)


# 读取数据
data <- read.csv("C:/Users/levon/Desktop/课内实验/统计模拟与R语言/herb.csv", header = TRUE)
data <- data[, -4]
pairs(data)
cor(data)

# 假设model是我们的初始模型，包含了所有候选自变量
initial_model <- lm(Y ~ 1 + X1 + X2 + X3 + X4, data = data)

# 进行逐步回归
stepwise_model <- step(initial_model, direction = "both", scope = list(lower = ~1, upper = ~X1 + X2 + X3 + X4))

# 查看逐步回归后的模型
summary(stepwise_model)


# 学生化残差
rstandard(stepwise_model)

# 残差图
plot(resid(model) ~ fitted(stepwise_model))
abline(h = 0, col = "red")

# 安装并加载lmtest包
install.packages("lmtest")
library(lmtest)

# 学生化残差
rstandard(stepwise_model)

# Breusch-Pagan检验
bptest(stepwise_model)

# 残差的正态性检验
shapiro.test(resid(stepwise_model))

# Durbin-Watson检验
dwtest(stepwise_model)

# 安装并加载car包
install.packages("car")
library(car)

# 方差膨胀因子
vif(stepwise_model)

# 残差的诊断图
par(mfrow = c(2, 2))
plot(stepwise_model)


##################### 第二题 #################################

# 肥料A组数据
fertilizer_A <- c(25, 26, 28, 24, 29, 26, 26, 28, 25, 29)
# 肥料B组数据
fertilizer_B <- c(30, 32, 33, 31, 29, 31, 32, 30, 31, 34)
# 肥料C组数据
fertilizer_C <- c(27, 26, 25, 24, 28, 24, 26, 26, 24, 27)

# 计算每组的均值、标准差等
summary(fertilizer_A)
summary(fertilizer_B)
summary(fertilizer_C)


# 绘制箱型图
boxplot(fertilizer_A, fertilizer_B, fertilizer_C, 
        names=c("Fertilizer A", "Fertilizer B", "Fertilizer C"),
        main="Boxplot of Plant Growth by Fertilizer Type")

# 绘制直方图
par(mfrow=c(1,3)) # 设置图形排列
hist(fertilizer_A, main="Histogram of Fertilizer A", xlab="Height (cm)")
hist(fertilizer_B, main="Histogram of Fertilizer B", xlab="Height (cm)")
hist(fertilizer_C, main="Histogram of Fertilizer C", xlab="Height (cm)")
par(mfrow=c(1,1)) # 重置图形排列

# 设置图形参数
par(mar = c(5, 5, 2, 1), # 设置边距：下，左，上，右
    mfrow = c(1, 1))    # 设置图形排列为1行1列

# 计算密度估计
density_A <- density(fertilizer_A)
density_B <- density(fertilizer_B)
density_C <- density(fertilizer_C)

# 绘制密度曲线
plot(density_A, main="Density Estimates of Plant Growth by Fertilizer Type", 
     xlab="Height (cm)", ylab="Density", col="red", lwd=2, xlim=c(20, 35), ylim=
       c(0, max(density_A$y, density_B$y, density_C$y)))
lines(density_B, col="blue", lwd=2)
lines(density_C, col="green", lwd=2)
legend("topleft", legend=c("Fertilizer A", "Fertilizer B", "Fertilizer C"), 
       col=c("red", "blue", "green"), lwd=2)

# 肥料A组数据
fertilizer_A <- c(25, 26, 28, 24, 29, 26, 26, 28, 25, 29)
# 肥料B组数据
fertilizer_B <- c(30, 32, 33, 31, 29, 31, 32, 30, 31, 34)
# 肥料C组数据
fertilizer_C <- c(27, 26, 25, 24, 28, 24, 26, 26, 24, 27)

# 安装ggplot2包（如果尚未安装）
if (!require(ggplot2)) install.packages("ggplot2")

# 加载ggplot2包
library(ggplot2)

# 创建数据框
data <- data.frame(
  Height = c(fertilizer_A, fertilizer_B, fertilizer_C),
  Fertilizer = factor(rep(c("A", "B", "C"), each = length(fertilizer_A)))
)

# 创建小提琴图
ggplot(data, aes(x = Fertilizer, y = Height, fill = Fertilizer)) +
  geom_violin(trim = FALSE, scale = "area") +
  labs(x = "Fertilizer", y = "Height (cm)", 
       title = "Violin Plot of Plant Growth by Fertilizer Type") +
  theme_minimal() +
  scale_fill_manual(values = c("A" = "pink", "B" = "green", "C" = "lightblue1"))


# 安装并加载ggplot2包
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# 肥料A、B、C的数据
fertilizer_A <- c(25, 26, 28, 24, 29, 26, 26, 28, 25, 29)
fertilizer_B <- c(30, 32, 33, 31, 29, 31, 32, 30, 31, 34)
fertilizer_C <- c(27, 26, 25, 24, 28, 24, 26, 26, 24, 27)

# 创建数据框
data <- data.frame(
  Height = c(fertilizer_A, fertilizer_B, fertilizer_C),
  Fertilizer = factor(rep(c("A", "B", "C"), each = length(fertilizer_A)))
)

# 创建小提琴图加箱线图
ggplot(data, aes(x = Fertilizer, y = Height, fill = Fertilizer)) +
  geom_violin(trim = FALSE, color = "black", scale = "count") +  # 绘制小提琴图的轮廓
  geom_boxplot(width = 0.1, fill = NA, outlier.shape = NA) +  # 绘制箱线图，不显示异常点
  labs(x = "Fertilizer", y = "Height (cm)", 
       title = "Violin and Boxplot of Plant Growth by Fertilizer Type") +
  theme_minimal() +
  scale_fill_manual(values = c("A" = "pink", "B" = "green", "C" = "lightblue1"))  # 设置颜色

# 显示图表
ggsave("violin_and_boxplot.png", width = 10, height = 6, dpi = 300)


# 安装并加载所需的包
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# 为肥料A创建QQ图
par(mfrow=c(1,3))  # 设置图形排列为一行三列
qqnorm(fertilizer_A, col="red", pch=19)  # 红色点表示肥料A
qqline(fertilizer_A, col="red", lwd=2)

# 为肥料B创建QQ图
qqnorm(fertilizer_B, col="green", pch=19)  # 绿色点表示肥料B
qqline(fertilizer_B, col="green", lwd=2)

# 为肥料C创建QQ图
qqnorm(fertilizer_C, col="blue", pch=19)  # 蓝色点表示肥料C
qqline(fertilizer_C, col="blue", lwd=2)
par(mfrow=c(1,1))  # 重置图形排列



# 安装所需的包（如果尚未安装）
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(GGally)) install.packages("GGally")
if (!require(pheatmap)) install.packages("pheatmap")

# 加载所需的包
library(ggplot2)
library(GGally)
library(pheatmap)

# 创建数据框
data <- data.frame(
  Fer_A = fertilizer_A,
  Fer_B = fertilizer_B,
  Fer_C = fertilizer_C
)
# 使用GGally包创建矩阵散点图
ggpairs(data, 
        lower = list(continuous = "points", combo = "box"),
        upper = list(continuous = "smooth", combo = "box"))

# 计算相关性矩阵
cor(data)
# 创建相关性热力图
install.packages("corrplot")
library("corrplot")
data.cor<-cor(data)
corrplot(data.cor)
corrplot(data.cor, method="number", type ="upper",tl.co1= "n", tl.cex=0.8, tl.pos ="n",
tl.srt=45,add =T)


################# 第二题第二小问 ################

shapiro.test(fertilizer_A)
shapiro.test(fertilizer_B)
shapiro.test(fertilizer_C)

# 为肥料A创建QQ图
par(mfrow=c(1,3))  # 设置图形排列为一行三列
qqnorm(fertilizer_A, col="red", pch=19)  # 红色点表示肥料A
qqline(fertilizer_A, col="red", lwd=2)

# 为肥料B创建QQ图
qqnorm(fertilizer_B, col="green", pch=19)  # 绿色点表示肥料B
qqline(fertilizer_B, col="green", lwd=2)

# 为肥料C创建QQ图
qqnorm(fertilizer_C, col="blue", pch=19)  # 蓝色点表示肥料C
qqline(fertilizer_C, col="blue", lwd=2)
par(mfrow=c(1,1))  # 重置图形排列

fertilizer_A <- c(25, 26, 28, 24, 29, 26, 26, 28, 25, 29)
fertilizer_B <- c(30, 32, 33, 31, 29, 31, 32, 30, 31, 34)
fertilizer_C <- c(27, 26, 25, 24, 28, 24, 26, 26, 24, 27)

# 进行Bartlett检验
bartlett_test_result <- bartlett.test(list(fertilizer_A, fertilizer_B, fertilizer_C))

# 输出测试结果
print(bartlett_test_result)

# 决策
alpha <- 0.05
if(bartlett_test_result$p.value <= alpha) {
  cat("拒绝零假设 - 方差不齐\n")
} else {
  cat("不能拒绝零假设 - 方差齐\n")
}

# 创建数据框
data <- data.frame(
  PlantHeight = c(25, 26, 28, 24, 29, 26, 26, 28, 25, 29,
                  30, 32, 33, 31, 29, 31, 32, 30, 31, 34,
                  27, 26, 25, 24, 28, 24, 26, 26, 24, 27),
  Fertilizer = factor(c(rep("A", 10), rep("B", 10), rep("C", 10)))
)

# 进行ANOVA
aov_model <- aov(PlantHeight ~ Fertilizer, data = data)
summary(aov_model)

# 使用pairwise.t.test进行多重t检验
pairwise_t_test_result <- pairwise.t.test(data$PlantHeight, 
data$Fertilizer, p.adjust.method = "bonferroni", pool.sd = TRUE)
print(pairwise_t_test_result)

# 使用TukeyHSD进行多重比较
tukey_result <- TukeyHSD(aov_model)
print(tukey_result)



set.seed(123)
n <- 1000
x <- runif(n, 0, 1)
mean_x <- cumsum(x)/(1:n)

plot(1:n, mean_x, type="l", col="blue", ylim=c(0,1))
abline(h=0.5, col="red") # 0.5是均匀分布的期望值


 