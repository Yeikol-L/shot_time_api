/// <reference path="./.sst/platform/config.d.ts" />

export default $config({
  app(input) {
    return {
      name: 'short-time-api',
      removal: input?.stage === 'production' ? 'retain' : 'remove',
      protect: ['production'].includes(input?.stage),
      home: 'aws',
    };
  },
  async run() {
    const vpc = new sst.aws.Vpc('MyVpc');
    const bucket = new sst.aws.Bucket("profile-bucket", {access: 'public' });
    const cluster = new sst.aws.Cluster('MyCluster', { vpc });

    cluster.addService('MyService', {
      link: [bucket],
      loadBalancer: {
        ports: [{ listen: '80/http', forward: '3000/http' }],
      },
      dev: {
        command: 'npm run start:dev',
      },
    });
    return {bucket}
  },
});
