// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_Lowpara_Low_BaseColor("Low para_Low_BaseColor", 2D) = "white" {}
		_Lowpara_Low_Normal("Low para_Low_Normal", 2D) = "bump" {}
		_Lowpara_Low_Roughness("Low para_Low_Roughness", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Lowpara_Low_Normal;
		uniform float4 _Lowpara_Low_Normal_ST;
		uniform sampler2D _Lowpara_Low_BaseColor;
		uniform float4 _Lowpara_Low_BaseColor_ST;
		uniform sampler2D _Lowpara_Low_Roughness;
		uniform float4 _Lowpara_Low_Roughness_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Lowpara_Low_Normal = i.uv_texcoord * _Lowpara_Low_Normal_ST.xy + _Lowpara_Low_Normal_ST.zw;
			o.Normal = UnpackNormal( tex2D( _Lowpara_Low_Normal, uv_Lowpara_Low_Normal ) );
			float2 uv_Lowpara_Low_BaseColor = i.uv_texcoord * _Lowpara_Low_BaseColor_ST.xy + _Lowpara_Low_BaseColor_ST.zw;
			o.Albedo = tex2D( _Lowpara_Low_BaseColor, uv_Lowpara_Low_BaseColor ).rgb;
			float2 uv_Lowpara_Low_Roughness = i.uv_texcoord * _Lowpara_Low_Roughness_ST.xy + _Lowpara_Low_Roughness_ST.zw;
			o.Smoothness = ( 1.0 - tex2D( _Lowpara_Low_Roughness, uv_Lowpara_Low_Roughness ) ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
26;35;1906;1010;953;500.5;1;True;False
Node;AmplifyShaderEditor.SamplerNode;3;-264,257.5;Float;True;Property;_Lowpara_Low_Roughness;Low para_Low_Roughness;2;0;Create;True;0;0;False;0;76953ac93fe23984f871c913521fb731;76953ac93fe23984f871c913521fb731;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;4;110,148.5;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2;-482,12.5;Float;True;Property;_Lowpara_Low_Normal;Low para_Low_Normal;1;0;Create;True;0;0;False;0;59cb57a9d5eb6f04eb4e8528fcb0a2de;59cb57a9d5eb6f04eb4e8528fcb0a2de;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-428,-317.5;Float;True;Property;_Lowpara_Low_BaseColor;Low para_Low_BaseColor;0;0;Create;True;0;0;False;0;e8c148d035dd090488c91394694a327f;e8c148d035dd090488c91394694a327f;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;392,-105;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;4;0;3;0
WireConnection;0;0;1;0
WireConnection;0;1;2;0
WireConnection;0;4;4;0
ASEEND*/
//CHKSM=2E3FFDDA53FEDCCA7818C59B050F767A3BDE6453