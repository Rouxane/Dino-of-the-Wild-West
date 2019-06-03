// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_lambert1_Roughness("lambert1_Roughness", 2D) = "white" {}
		_lambert1_Mixed_AO("lambert1_Mixed_AO", 2D) = "white" {}
		_lambert1_Base_Color("lambert1_Base_Color", 2D) = "white" {}
		_lambert1_Normal_DirectX("lambert1_Normal_DirectX", 2D) = "bump" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _lambert1_Normal_DirectX;
		uniform float4 _lambert1_Normal_DirectX_ST;
		uniform sampler2D _lambert1_Base_Color;
		uniform float4 _lambert1_Base_Color_ST;
		uniform sampler2D _lambert1_Roughness;
		uniform float4 _lambert1_Roughness_ST;
		uniform sampler2D _lambert1_Mixed_AO;
		uniform float4 _lambert1_Mixed_AO_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_lambert1_Normal_DirectX = i.uv_texcoord * _lambert1_Normal_DirectX_ST.xy + _lambert1_Normal_DirectX_ST.zw;
			o.Normal = UnpackNormal( tex2D( _lambert1_Normal_DirectX, uv_lambert1_Normal_DirectX ) );
			float2 uv_lambert1_Base_Color = i.uv_texcoord * _lambert1_Base_Color_ST.xy + _lambert1_Base_Color_ST.zw;
			o.Albedo = tex2D( _lambert1_Base_Color, uv_lambert1_Base_Color ).rgb;
			float2 uv_lambert1_Roughness = i.uv_texcoord * _lambert1_Roughness_ST.xy + _lambert1_Roughness_ST.zw;
			o.Smoothness = ( 1.0 - tex2D( _lambert1_Roughness, uv_lambert1_Roughness ) ).r;
			float2 uv_lambert1_Mixed_AO = i.uv_texcoord * _lambert1_Mixed_AO_ST.xy + _lambert1_Mixed_AO_ST.zw;
			o.Occlusion = tex2D( _lambert1_Mixed_AO, uv_lambert1_Mixed_AO ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
7;431;1918;1016;1459.256;115.7077;1;True;True
Node;AmplifyShaderEditor.SamplerNode;1;-717,151.5;Float;True;Property;_lambert1_Roughness;lambert1_Roughness;0;0;Create;True;0;0;False;0;ce36e94f6e008814c8bc9e22da22c837;ce36e94f6e008814c8bc9e22da22c837;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-756,397.5;Float;True;Property;_lambert1_Mixed_AO;lambert1_Mixed_AO;1;0;Create;True;0;0;False;0;92c538ec2fcfe9f448f7884b73b4d5a9;92c538ec2fcfe9f448f7884b73b4d5a9;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;5;-899.1772,-73.96861;Float;True;Property;_lambert1_Normal_DirectX;lambert1_Normal_DirectX;3;0;Create;True;0;0;False;0;39589c3018467444393f14df50a0ee44;39589c3018467444393f14df50a0ee44;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-559.0002,-240.1002;Float;True;Property;_lambert1_Base_Color;lambert1_Base_Color;2;0;Create;True;0;0;False;0;d01b5bb361dead04caa1fa87a13eb921;d01b5bb361dead04caa1fa87a13eb921;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;6;-324.2561,182.2923;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;0;1;0
WireConnection;0;0;4;0
WireConnection;0;1;5;0
WireConnection;0;4;6;0
WireConnection;0;5;3;0
ASEEND*/
//CHKSM=6EDE2B45EB6D71EFB9D1CDFDB3F92971AB664A2C