using Flux
using Flux: Data.DataLoader
using Flux: onehotbatch, onecold, crossentropy
using Flux: @epochs
using Statistics
using MLDatasets
using BenchmarkTools
#changes

#Load mnist dataset
train_set, train_labels = MLDatasets.MNIST.traindata(Float32)
valid_set, valid_labels = MLDatasets.MNIST.testdata(Float32)

#Add channel to images (28, 28) --> (28, 28, 1)
train_set = Flux.unsqueeze(train_set, 3)
valid_set = Flux.unsqueeze(valid_set, 3)

train_labels = onehotbatch(train_labels, 0:9)
valid_labels = onehotbatch(valid_labels, 0:9)

train_data_loader = DataLoader(train_set, train_labels, batchsize=128, shuffle=true)
model = Chain(
    Conv((5, 5), 1=>8, pad=2, stride=2, relu), # 28x28 => 14x14
    Conv((3, 3), 8=>16, pad=1, stride=2, relu), # 14x14 => 7x7
    Conv((3, 3), 16=>32, pad=1, stride=2, relu), # 7x7 => 4x4
    Conv((3, 3), 32=>32, pad=1, stride=2, relu), # 4x4 => 2x2
    
    GlobalMeanPool(), # Average pooling on each width x height feature map

    flatten,
    
    Dense(32, 10),
    softmax)

accuracy(ŷ, y) = mean(onecold(ŷ) .== onecold(y))
loss(x, y) = Flux.crossentropy(model(x), y)
lr = 0.1 # learning rate
opt = Descent(lr)
ps = Flux.params(model)

number_epochs = 10

println(@benchmark @epochs number_epochs Flux.train!(loss, ps, train_data_loader, opt))
println(accuracy(model(valid_set), valid_labels))