#version 330 core

in vec3 Normal; //法线
in vec3 FragPos; //片段位置

uniform vec3 lightPos;

out vec4 FragColor;
  
uniform vec3 objectColor;
uniform vec3 lightColor;

void main()
{
    vec3 norm = normalize(Normal); //法线单位向量
    vec3 lightDir = normalize(lightPos - FragPos);//方向单位向量
    //如果两个向量之间的角度大于90度，点乘的结果就会变成负数，这样会导致漫反射分量变为负数。负数颜色的光照是没有定义的，所以最好避免它
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = diff * lightColor; //漫反射分量
    float ambientStrength = 0.5; //坏境光照强度
    vec3 ambient = ambientStrength * lightColor; //环境光分量
    vec3 result = (ambient + diffuse) * objectColor;
    FragColor = vec4(result, 1.0);
}