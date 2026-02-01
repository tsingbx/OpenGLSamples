#version 330 core

out vec4 FragColor;

in vec2 TexCoords;

uniform sampler2D screenTexture;

void main()
{
    //让整个图像灰度化(Grayscale)
    FragColor = texture(screenTexture, TexCoords);
    //取所有的颜色分量，将它们平均化
    float average = (FragColor.r + FragColor.g + FragColor.b) / 3.0;
    FragColor = vec4(average, average, average, 1.0);
} 