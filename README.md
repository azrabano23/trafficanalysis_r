# 🚗 Data Analysis on Traffic Accidents

## 📌 Dataset Information  
- 📂 **Source**: Kaggle  
- 🔗 **Link**: [Traffic Accidents Dataset](#)  
- 🎯 **Purpose**: Analyze traffic accident trends and derive insights to inform public safety strategies and policy decisions.

---

## ❗ Problem Statement

Traffic accidents are a **leading cause of death and injury worldwide**, resulting in millions of lives lost or impacted each year.  
> 📉 *According to the World Health Organization (2023), approximately **1.19 million people die each year** due to road traffic crashes, and tens of millions more suffer non-fatal injuries, often with long-term consequences.*  
> *(Source: WHO Global Status Report on Road Safety, 2023)*

In the U.S. alone, **speeding, distracted driving, and adverse weather** continue to be major contributors to fatal crashes. By analyzing patterns in accident data, we can uncover **critical risk factors**, **high-risk timeframes**, and **environmental triggers** — helping policymakers, urban planners, and law enforcement develop more effective prevention strategies.

---

## 📖 Table of Contents  
- 🏆 Event Participation  
- 📊 Analysis Objectives  
- 🛠️ Methodology  
- 🔑 Key Findings  
- 🚦 Preventive Measures  
- 🏁 Conclusion  
- 📜 License  

---

## 🏆 Event Participation  
- 🏛️ **Competition**: Spring 2025 Datathon hosted by Bits  
- 🥉 **Achievement**: Honorable Mention (3rd Place)  
- 👥 **Team Members**: Preet Patel, Azra Bano, Avani Kadlaskar, and Prisha Barot  

---

## 📊 Analysis Objectives  
- 🔍 **Identify Common Causes**: Environmental, human, and vehicular factors contributing to accidents  
- ⏳ **Determine High-Risk Timeframes**: Analyze time-of-day, day-of-week, and seasonal trends  
- 🏙️ **Compare Urban vs. Rural Patterns**  
- 🌧️ **Study Weather Impact on Severity**

---

## 🛠️ Methodology

### 🖥️ Tools Used  
- **R Programming Language**  
  - For data cleaning, wrangling, visualization, and statistical analysis

### 📊 Exploratory Data Analysis (EDA)
- 📌 Accident frequency by hour/day/month
- 🌦️ Correlation between weather (rain, fog, snow) and accident severity
- 🚥 Location-based comparisons (urban vs. rural)
- 👤 Behavioral indicators like speeding or distracted driving

### 🔬 Example R Code for Data Import
```r
# Load dataset
traffic_data <- read.csv("accidents.csv")

# Quick summary
summary(traffic_data)
```

---

## 🔑 Key Findings

- ⏱️ **Peak Accident Hours**: Higher occurrences during **rush hours (7–9AM, 4–7PM)** and **late nights (11PM–2AM)**
- 🌧️ **Weather Impact**: Rain and fog correlate with a significant increase in accident rates
- 🏙️ **Urban vs. Rural**: Urban areas have more frequent accidents, while rural crashes tend to be more severe
- 🚗 **Human Factors**: Distracted driving and speeding remain top behavioral risks

---

## 🚦 Preventive Measures

### 📜 Policy Recommendations:
- 🛂 Enhanced **traffic monitoring** using sensors and cameras in high-risk zones
- 🚦 Stricter **speed regulation** enforcement during peak accident times
- 📱 Awareness campaigns targeting **distracted driving and impaired driving**

---

## 🏁 Conclusion

The data reveals that traffic safety is deeply influenced by time, weather, and human behavior. With these insights, stakeholders — from local governments to national agencies — can adopt **data-driven strategies** to reduce accidents, **save lives**, and create safer roads for everyone.

---

## 📜 License

This project is open-source and available for educational and research use.
