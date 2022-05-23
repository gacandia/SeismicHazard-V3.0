import sys
sys.path.append('./cpypython')
import pyCPT
import post_process
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import os
import shutil
from itertools import groupby
'''
you can specify how many soil types are there but not the number of layers
'''

class Complayer():
	"""docstring for ClassName"""
	def __init__(self, path, num_soil_type=-999):
		
	
		
		
		if num_soil_type == -999:
			print("automatic layer number detetection")
			self.obj = pyCPT.CPT(path)	
			self.analysis = self.obj.segmentation(num_of_iter=500, start_iter=200 )
			
			
		else:
			print("user defined layer number")
			self.obj = pyCPT.CPT(path, thin_layer_criteria=0.25, do_model_selection=False)
			self.analysis = self.obj.segmentation(num_of_iter=200, start_iter=100,n_labels = num_soil_type )
			
		
		self.layers = self.obj.detect_layers()

		self.data = pd.read_csv(path,header=None,names=['depth','Fr','Qt'])

		self.hard_boundary = np.tile(self.obj.layer_info[0], 2)
		self.soft_boundary = np.tile(self.obj.layer_info[1], 2)
		self.soil_label = self.obj.layer_info[-1]
		
	def plot_layers(self):
		#if 'results' in os.listdir('./'):
		#	shutil.rmtree('./results')
		#	os.mkdir('./results')
		#else:
		#	os.mkdir('./results')

		pyCPT.plot_layers(self.obj)
		#plt.show()
		plt.savefig('./results/SBTtype.png',dpi=400)

	def plot_cpt(self):

		hard = self.hard_boundary[:,0]
		soft = self.soft_boundary[:,0]
		
		soil_type = self.soil_label

		plt.figure(figsize = (5,10))
		plt.plot(self.data['Fr'],self.data['depth'])
		for item in hard:
			plt.hlines(item,0,np.max(self.data['Fr']), color='k',label ='outer boundary' )
		for item in soft:
			plt.hlines(item,0,np.max(self.data['Fr']),color = 'red',linestyles='--' ,label='inner boundary')

		plt.title('Fr')
		plt.ylabel('depth (m)')
		
		plt.gca().invert_yaxis()
		plt.savefig('./results/Frplot.png',dpi=400)


		plt.figure(figsize = (5,10))
		plt.plot(self.data['Qt'],self.data['depth'])
		for item in hard:
			plt.hlines(item,0,np.max(self.data['Qt']), color='k',label ='outer boundary' )
		for item in soft:
			plt.hlines(item,0,np.max(self.data['Qt']),color = 'red',linestyles='--' ,label='inner boundary')
		plt.title('Qt')
		plt.ylabel('depth (m)')

		plt.gca().invert_yaxis()
		plt.savefig('./results/Qtplot.png',dpi=400)



		total_boundary = np.sort(np.concatenate((soft, hard), axis=None))
		soil_type_unique = [x[0] for x in groupby(soil_type)]
		#temp_1 = np.concatenate(([self.data["depth"].iloc[0]], np.array(total_boundary)))
		#temp_2 = np.concatenate((np.array(total_boundary), [self.data["depth"].iloc[-1]]))
		text_location = []
		temploc = np.concatenate( (total_boundary,[self.data['depth'].iloc[-1]]) )
		for i in range(len(total_boundary)):
			text_location.append((temploc[i] + temploc[i+1])/2)
		

		plt.figure(figsize = (5,10))
		for item in hard:
			plt.hlines(item,0,1, color='k',label ='outer boundary' )
		for item in soft:
			plt.hlines(item,0,1,color = 'red',linestyles='--' ,label='inner boundary')
		for i in range(len(text_location)):
			plt.text(0.8,text_location[i],s = str(int(soil_type_unique[i])))
		plt.title('Soil type inferred')
		plt.ylabel('depth (m)')
		plt.ylim(0,self.data['depth'].iloc[-1])
		
		plt.gca().invert_yaxis()
		plt.savefig('./results/Estimatedtype.png',dpi=400)



		total_result = pd.DataFrame({'allboundary': total_boundary})
		hard_result = pd.DataFrame({"hardboundary": hard})

		total_result.to_csv('./results/total_boundary.csv')
		hard_result.to_csv("./results/hard_boundary.csv")

		
		








	

