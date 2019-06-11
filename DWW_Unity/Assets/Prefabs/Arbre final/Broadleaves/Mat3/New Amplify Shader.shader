// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_BroadleafBark("BroadleafBark", 2D) = "white" {}
		_BroadleafBark_Normal("BroadleafBark_Normal", 2D) = "bump" {}
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

		uniform sampler2D _BroadleafBark_Normal;
		uniform float4 _BroadleafBark_Normal_ST;
		uniform sampler2D _BroadleafBark;
		uniform float4 _BroadleafBark_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_BroadleafBark_Normal = i.uv_texcoord * _BroadleafBark_Normal_ST.xy + _BroadleafBark_Normal_ST.zw;
			o.Normal = UnpackNormal( tex2D( _BroadleafBark_Normal, uv_BroadleafBark_Normal ) );
			float2 uv_BroadleafBark = i.uv_texcoord * _BroadleafBark_ST.xy + _BroadleafBark_ST.zw;
			o.Albedo = tex2D( _BroadleafBark, uv_BroadleafBark ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
-59;229;1906;1004;953;500.5;1;True;True
Node;AmplifyShaderEditor.SamplerNode;1;-464,-402.5;Float;True;Property;_BroadleafBark;BroadleafBark;0;0;Create;True;0;0;False;0;ad229feadaa5126418a4c803ee6567a6;ad229feadaa5126418a4c803ee6567a6;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-488,-111.5;Float;True;Property;_BroadleafBark_Normal;BroadleafBark_Normal;1;0;Create;True;0;0;False;0;e63ec522ed4c48e47a07b761168e3b46;e63ec522ed4c48e47a07b761168e3b46;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;0;0;1;0
WireConnection;0;1;2;0
ASEEND*/
//CHKSM=4D80499A5330013B8887DC7BAF618D5E9D139ECB