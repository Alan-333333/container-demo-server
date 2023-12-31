# 指定基础镜像为Golang
FROM golang:1.17-alpine AS build

# 设置工作目录
WORKDIR /app

# 将代码复制到容器中
COPY . .

# 下载依赖
RUN go mod download  

# 构建应用
RUN go build -o /go-app 

# 启动容器时执行的命令
CMD ["/go-app"]  

# 指定第二阶段的基础镜像为Alpine
# 该镜像更轻量 
FROM alpine:latest  

# 将第一阶段构建的二进制文件复制过来
COPY --from=build /go-app /go-app

# 暴露端口8080
EXPOSE 8080

# 容器启动命令
CMD ["/go-app"]
