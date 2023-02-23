#define PI 3.1415926535897932384626433832795

varying vec2 vUv;
uniform float uMultiplier;
uniform float uAlpha;
uniform vec3 uColorA;
uniform vec3 uColorB;
uniform float uTime;

void main() {
  vec2 mulvUv = mod(vUv * uMultiplier, 1.0);
  float angle = atan(mulvUv.x - 0.5, mulvUv.y - 0.5) / (PI * 2.0) + 0.5;
  float radius = 0.25 + sin(angle * 100.0) * 0.02;

  float strength = 1.0 - step(0.1, abs(distance(mod(mulvUv + sin(uTime), 1.0), vec2(0.5)) - radius));

  vec3 mixColor = mix(uColorA, uColorB, mod(mulvUv.y + uTime, 1.0));

  gl_FragColor.rgba = vec4(mixColor, min(strength, uAlpha));
}