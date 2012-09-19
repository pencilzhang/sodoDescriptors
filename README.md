sodoDescriptors
===============

compute Single-Opponent(SO)/Double-Opponent(DO) descriptors and energy model in grayscale as well
===============
SODescriptor/DODescriptor: to compute SO/DO descriptors

energyRes: to compute energy response inspired from :
Edward H. Adelson and James R. Bergen. Spatiotemporal energy models for the perception of motion. JOSA, 1985



We provided two examples:
1. additive color image used in Zhang et al.2012

2. blue-sky image:
a representative color image to show how color descriptors work

You may need adjust the normalization params according to different images.
In general, we found k=1, sigma=0.225 would be better for natural images which is constrained  by neural data.

Gabor filters used in HMAX are used to extract edges. 

Any gradient operators could be used to generate SO and DO descriptors, such as Gaussian derivatives.

If you use it, please cite:
Zhang J., Barhomi Y., and Serre T. A new biologically inspired color image descriptor.In: ECCV, Florence, Italy, October 2012. 


For comments or questions please contact Jun Zhang (zhangjun1126@gmail.com)

