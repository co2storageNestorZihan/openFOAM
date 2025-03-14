# **OpenFOAM Tutorials Repository**  

This repository contains a series of tutorials from CE597 Computational Modeling with OpenFOAM® taught by Xiaofeng Liu, Ph.D. These tutorials are designed to help students get familiar with OpenFOAM, covering topics from remote setup to creating custom simulation cases.  

---

## **📌 Tutorial Contents**  

### **1️⃣ Tutorial 1: Remote Connection to a Linux Computer**  
📄 **File:** [`Tut_1_How_to_remote_connect_to_Linux_computer.pdf`](Tut_1_How_to_remote_connect_to_Linux_computer.pdf)  
✅ Explains how to remotely connect to a Linux system using SSH and PuTTY.  
✅ Provides instructions for accessing high-performance computing (HPC) systems at Penn State.  
✅ Covers the use of VNC for remote desktop access.  

### **2️⃣ Tutorial 2: Compilation of OpenFOAM from Source** *(⚡ Special Focus on this tutorial)*  
📄 **File:** [`Tut_2_Compilation_of_OF_from_source_Official_release_v2412.pdf`](Tut_2_Compilation_of_OF_from_source_Official_release_v2412.pdf)  
✅ **OpenFOAM runs on Linux**, and this tutorial provides a **step-by-step guide** on how to download, unpack, and compile OpenFOAM v2412 on a Linux system.  
✅ Covers different installation methods, including precompiled binaries and building from source.  
✅ Explains how to set up environment variables in `.bashrc` to ensure a proper installation.  
✅ Includes details on installing C++ compilers and configuring MPI for parallel execution.  
✅ **Alternative Option:** Instead of installing OpenFOAM on your own system, you can use **[ROAR Colab at Penn State](https://www.icds.psu.edu/computing/roar-colab/)**, which provides an environment with OpenFOAM preinstalled.  

👉 **This tutorial is essential if you plan to modify OpenFOAM source code or need a custom version for your workflow.**  

### **3️⃣ Tutorial 3: Basic Usage and Structure of OpenFOAM**  
📄 **File:** [`Tut_3_OpenFOAM_basic_usage_and_structure.pdf`](Tut_3_OpenFOAM_basic_usage_and_structure.pdf)  
✅ Explains OpenFOAM's software organization and file structure.  
✅ Guides users on navigating OpenFOAM using commands and environment variables (`foam`, `run`, `sol`, etc.).  
✅ Describes the typical OpenFOAM workflow: case setup, simulation execution, and post-processing with ParaView.  

### **4️⃣ Tutorial 4: Building Your Own OpenFOAM Simulation Cases**  
📄 **File:** [`Tut_4_Build_your_own_OpenFOAM_cases.pdf`](Tut_4_Build_your_own_OpenFOAM_cases.pdf)  
✅ Explains how to create custom OpenFOAM simulation cases from scratch.  
✅ Introduces tools like `blockMesh` and `m4 scripting` to generate efficient meshes.  
✅ Includes advanced examples such as **flow over a step** and **meandering channel simulations**.  

---

## **📬 Communication and Contributions**  
If you have any questions or suggestions about these tutorials, feel free to open an **issue** or contribute improvements to the repository.  

🚀 **We hope these tutorials help enhance your OpenFOAM experience!**  

---