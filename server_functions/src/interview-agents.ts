export function formatAgents(rawAgents: any[]): any[] {
    return rawAgents.map((agent) => ({
      agentId: agent.id,
      name: agent.name,
      description: agent.description,
      topics: agent.topics || [],
      feedbackTemplate: agent.feedbackTemplate || {},
      textToSpeechConfig: agent.textToSpeechConfig || {},
      imageUrl: agent.imageUrl || "",
      lastUpdated: new Date().toISOString(),
    }));
  }
  