import { Firestore } from "@google-cloud/firestore";

const db = new Firestore();

export async function saveAgentsToFirestore(agents: any[]) {
  try {
    const batch = db.batch();
    const agentsCollection = db.collection("agents");

    agents.forEach((agent) => {
      const docRef = agentsCollection.doc(agent.agentId);
      batch.set(docRef, {
        ...agent,
        lastUpdated: new Date().toISOString(),
      });
    });

    await batch.commit();
    console.log("Agents successfully saved to Firestore.");
  } catch (error) {
    console.error("Error saving agents to Firestore:", error);
    throw new Error("Failed to save agents to Firestore");
  }
}
