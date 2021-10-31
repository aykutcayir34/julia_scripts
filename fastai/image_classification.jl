using CairoMakie
using FastAI
dir = joinpath(datasetpath("dogscats"), "train")
data = loadtaskdata(dir, ImageClassificationTask)
samples = [getobs(data, i) for i in rand(1:nobs(data), 9)]
classes = Datasets.getclassesclassification(dir)
method = ImageClassification(classes, (128, 128))
plotsamples(method, samples)
learner = methodlearner(method, shuffleobs(data), Models.xresnet18())
(xs, ys), _ = iterate(learner.data.training)
plotbatch(method, xs, ys)